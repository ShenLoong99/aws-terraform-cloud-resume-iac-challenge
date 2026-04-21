terraform {
  required_version = ">= 1.5.0"
  cloud {
    organization = "my-terraform-aws-projects-2025"

    workspaces {
      name = "aws-terraform-cloud-resume-iac-challenge"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudns = {
      source  = "cloudns/cloudns"
      version = "~> 1.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudResumeChallenge"
      Environment = "Production"
      ManagedBy   = "Terraform"
      Owner       = "ShenLoong"
    }
  }
}

# Aliased provider for ACM
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "cloudns" {
  auth_id  = var.CLOUD_USER_ID
  password = var.CLOUD_PASSWORD
}
