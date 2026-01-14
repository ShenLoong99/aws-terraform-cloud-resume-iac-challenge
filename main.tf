# THE ARCHIVE RESOURCE (Zips your code automatically)
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/func.py"
  output_path = "${path.module}/lambda/func.zip"
}

# THE STORAGE (S3 Bucket for Frontend)
resource "aws_s3_bucket" "resume_bucket" {
  bucket        = "my-unique-resume-bucket-${random_string.bucket_suffix.result}" # S3 bucket names must be globally unique
  force_destroy = true
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket_website_configuration" "resume_config" {
  bucket = aws_s3_bucket.resume_bucket.id
  index_document { suffix = "index.html" }
}

# Upload the index.html file to the S3 Bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.resume_bucket.id
  key    = "index.html"

  # This line "reads" the html and replaces ${api_url} with the real Gateway URL
  content = templatefile("${path.module}/website-files/index.html", {
    api_url = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
  })
  content_type = "text/html"

  # This creates a MD5 hash of the content. 
  # If the content changes, the etag changes, forcing S3 to accept the new upload.
  etag = md5(templatefile("${path.module}/website-files/index.html", {
    api_url = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
  }))
}

# THE DATABASE (DynamoDB for visitor count)
resource "aws_dynamodb_table" "visitor_count" {
  name         = "VisitorCount"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

# THE API (Lambda Function)
resource "aws_lambda_function" "resume_api" {
  # This line tells Terraform to use the zip created above
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  function_name = "resume_counter"
  role          = aws_iam_role.lambda_role.arn
  handler       = "func.handler"
  runtime       = "python3.9"

  depends_on = [aws_iam_role_policy_attachment.lambda_logs]
}

# This creates a "connection" between your Lambda's Role and the Logging Policy
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# (Optional but Recommended) Create the actual Log Group in CloudWatch
# This allows you to control how long logs are kept (e.g., 7 days) to save money.
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/resume_counter"
  retention_in_days = 7
}

# THE PERMISSIONS (IAM Role for Lambda)
resource "aws_iam_role" "lambda_role" {
  name = "resume_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

# ADDING DYNAMODB PERMISSIONS (So Lambda can talk to the DB)
resource "aws_iam_policy" "lambda_db_policy" {
  name        = "resume_lambda_db_policy"
  description = "Allow Lambda to update DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:UpdateItem",
          "dynamodb:GetItem"
        ],
        Effect   = "Allow",
        Resource = aws_dynamodb_table.visitor_count.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "db_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_db_policy.arn
}

# THE API GATEWAY (HTTP API)
resource "aws_apigatewayv2_api" "resume_api_gw" {
  name          = "resume-api-gw"
  protocol_type = "HTTP"

  # This allows your website to talk to the API from a different domain
  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET", "POST", "OPTIONS"]
    allow_headers = ["content-type"]
  }
}

# THE STAGE (The "environment" - e.g., prod or dev)
resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.resume_api_gw.id
  name        = "$default"
  auto_deploy = true
}

# THE INTEGRATION (Connecting Gateway to Lambda)
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.resume_api_gw.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.resume_api.invoke_arn
}

# THE ROUTE (Creating the /getcount endpoint)
resource "aws_apigatewayv2_route" "api_route" {
  api_id    = aws_apigatewayv2_api.resume_api_gw.id
  route_key = "GET /getcount"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# PERMISSION (Allowing API Gateway to call Lambda)
resource "aws_lambda_permission" "api_gw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.resume_api.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.resume_api_gw.execution_arn}/*/*"
}

# Create the Origin Access Control (The "Security Guard")
resource "aws_cloudfront_origin_access_control" "resume_oac" {
  name                              = "resume-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# Create the CloudFront Distribution
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
    origin_id                = "S3Origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.resume_oac.id
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3Origin"

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.resume_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipalReadOnly"
        Effect    = "Allow"
        Principal = { Service = "cloudfront.amazonaws.com" }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.resume_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.s3_distribution.arn
          }
        }
      }
    ]
  })
}

# Ensure Public Access is BLOCKED (Best Practice)
resource "aws_s3_bucket_public_access_block" "resume_bucket_block" {
  bucket = aws_s3_bucket.resume_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}