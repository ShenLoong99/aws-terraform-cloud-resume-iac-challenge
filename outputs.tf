output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.resume_api.arn
}

output "api_url" {
  description = "The URL of the API Gateway"
  value       = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
}

output "website_bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.resume_bucket.id
}

output "cloudfront_dist_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "website_url" {
  description = "The URL of the CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "linkedin" {
  description = "The LinkedIn profile URL"
  value       = "https://www.linkedin.com/in/tan-si-kai"
}

output "github_repo" {
  description = "The GitHub repository URL"
  value       = "https://github.com/tansikai/aws-terraform-cloud-resume-iac-challenge"
}

output "github_profile" {
  description = "The GitHub profile URL"
  value       = "https://github.com/ShenLoong99"
}

output "email_address" {
  description = "The email address"
  value       = "tansikai554@gmail.com"
}