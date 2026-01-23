variable "lambda_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "lambda_logs" {
  description = "Policy attachment of Lambda Log"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "default_tags" {
  description = "Extra tags to pass to the provider"
  type        = map(string)
}
