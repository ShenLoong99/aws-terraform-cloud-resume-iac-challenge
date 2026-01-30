variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "default_tags" {
  description = "Extra tags to pass to the provider"
  type        = map(string)
}

variable "lambda_role_id" {
  description = "The ID of the lambda role"
  type        = string
}
