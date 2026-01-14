# Cloudwatch Logging Permissions for Lambda
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