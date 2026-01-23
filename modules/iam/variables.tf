variable "function_name" {
  description = "The function name of the lambda"
  type        = string
}

variable "execution_arn" {
  description = "Execution arn of the API Gateway"
  type        = string
}

variable "website_bucket_id" {
  description = "The id of the S3 bucket"
  type        = string
}

variable "s3_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "cdn_arn" {
  description = "The ARN of the CloudFront distribution"
  type        = string
}

variable "db_arn" {
  description = "The ARN of DynamoDB table"
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
