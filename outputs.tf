output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda.lambda_arn
}

output "api_url" {
  description = "The URL of the API Gateway"
  value       = module.api.api_url
}

output "website_bucket_id" {
  description = "The name of the S3 bucket"
  value       = module.storage.website_bucket_id
}

output "cloudfront_dist_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.cdn.cloudfront_dist_id
}

output "website_url" {
  description = "The URL of the CloudFront distribution"
  value       = module.cdn.website_url
}

output "aws_region" {
  description = "The AWS region where resources are deployed"
  value       = var.aws_region
}

# output "custom_domain_url" {
#   value = "https://${aws_route53_record.www.name}"
# }
