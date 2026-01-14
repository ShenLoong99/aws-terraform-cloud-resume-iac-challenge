# THE ARCHIVE RESOURCE (Zips your code automatically)
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/func.py"
  output_path = "${path.module}/lambda/func.zip"
}

# THE API (Lambda Function)
resource "aws_lambda_function" "resume_api" {
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  function_name    = "resume_counter"
  role             = aws_iam_role.lambda_role.arn
  handler          = "func.handler"
  runtime          = "python3.13"

  # COST: ARM64 is ~20% cheaper than x86
  architectures = ["arm64"]
  memory_size   = 128
  timeout       = 10

  depends_on = [aws_iam_role_policy_attachment.lambda_logs]
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
      Resource = aws_dynamodb_table.visitor_count.arn
    }]
  })
}