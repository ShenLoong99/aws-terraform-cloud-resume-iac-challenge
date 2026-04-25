output "website_bucket_id" {
  description = "The id of the S3 bucket"
  value       = aws_s3_bucket.resume_bucket.id
}

output "s3_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.resume_bucket.arn
}

output "s3_bucket_domain" {
  description = "The regional domain name of the S3 bucket (e.g., resume-bucket.s3.amazonaws.com)"
  value       = aws_s3_bucket.resume_bucket.bucket_regional_domain_name
}
