output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_iam_role.lambda_role.arn
}

output "lambda_logs" {
  description = "Policy attachment of Lambda Log"
  value       = aws_iam_role_policy_attachment.lambda_logs
}
