variable "domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "route53_zone_id" {
  description = "The ID of the Route 53 Hosted Zone"
  type        = string
}
