variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "cloud-resume"
}

variable "CLOUD_USER_ID" {
  description = "ClouDNS User ID for DNS validation"
  type        = string
  sensitive   = true
}

variable "CLOUD_PASSWORD" {
  description = "ClouDNS Password for DNS validation"
  type        = string
  sensitive   = true
}
