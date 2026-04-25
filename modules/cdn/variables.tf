variable "domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "s3_bucket_domain" {
  description = "The regional domain name of the S3 bucket (e.g., resume-bucket.s3.amazonaws.com)"
  type        = string
}
