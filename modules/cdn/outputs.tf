output "cloudfront_dist_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "website_url" {
  description = "The URL of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cdn_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.arn
}

output "custom_domain_url" {
  description = "The permanent URL for the Cloud Resume"
  value       = "https://${aws_route53_record.root.name}"
}
