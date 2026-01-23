output "website_bucket_id" {
  description = "The id of the S3 bucket"
  value       = aws_s3_bucket.resume_bucket.id
}

output "domain_name" {
  description = "Domain name of the S3 bucket"
  value       = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
}

output "s3_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.resume_bucket.arn
}
