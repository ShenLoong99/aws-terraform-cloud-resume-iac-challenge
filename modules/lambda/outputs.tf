output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.resume_api.arn
}

output "function_name" {
  description = "The function name of the lambda"
  value       = aws_lambda_function.resume_api.function_name
}

output "lambda_role_id" {
  description = "The ID of the lambda role"
  value       = aws_iam_role.lambda_role.id
}
