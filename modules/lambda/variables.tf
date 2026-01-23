variable "lambda_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role passed from the IAM module"
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
