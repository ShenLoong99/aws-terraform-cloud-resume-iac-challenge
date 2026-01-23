output "db_arn" {
  description = "The ARN of DynamoDB table"
  value       = aws_dynamodb_table.visitor_count.arn
}
