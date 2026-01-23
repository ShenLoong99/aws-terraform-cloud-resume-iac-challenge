# PERMISSION (Allowing API Gateway to call Lambda)
resource "aws_lambda_permission" "api_gw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.execution_arn}/*/*"
}

# SECURITY: Allow ONLY CloudFront to read from S3
resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = var.website_bucket_id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "s3:GetObject"
      Effect    = "Allow"
      Resource  = "${var.s3_arn}/*"
      Principal = { Service = "cloudfront.amazonaws.com" }
      Condition = {
        StringEquals = { "AWS:SourceArn" = var.cdn_arn }
      }
    }]
  })
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

# SECURITY: Grant only the permissions needed for this specific table
resource "aws_iam_role_policy" "lambda_db_policy" {
  name = "LambdaDynamoDBAccess"
  role = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["dynamodb:UpdateItem", "dynamodb:GetItem"]
      Effect   = "Allow"
      Resource = var.db_arn
    }]
  })
}

# Cloudwatch Logging Permissions for Lambda
# This creates a "connection" between your Lambda's Role and the Logging Policy
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
