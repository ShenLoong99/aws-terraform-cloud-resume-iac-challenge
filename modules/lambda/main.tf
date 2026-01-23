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
  role             = var.lambda_arn
  handler          = "func.handler"
  runtime          = "python3.13"

  # Enable X-Ray Tracing for the Lambda function
  tracing_config {
    mode = "Active"
  }

  # COST: ARM64 is ~20% cheaper than x86
  architectures = ["arm64"]
  memory_size   = 128
  timeout       = 10

  depends_on = [var.lambda_role_name]
}
