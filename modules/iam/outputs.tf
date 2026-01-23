output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_iam_role.lambda_role.arn
}

output "lambda_role_name" {
  description = "The name of the IAM role for the Lambda"
  value       = aws_iam_role.lambda_role.name
}
