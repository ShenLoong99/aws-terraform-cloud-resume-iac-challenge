# Local variables
locals {
  common_tags = {
    Project     = "CloudResumeChallenge"
    Environment = "Production"
    ManagedBy   = "Terraform"
    Owner       = "ShenLoong"
  }
}

# Module for S3
module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
  aws_region   = var.aws_region
  default_tags = local.common_tags
  cdn_arn      = module.cdn.cdn_arn
}

# Module for Cloudfront
module "cdn" {
  source       = "./modules/cdn"
  domain_name  = module.storage.domain_name
  aws_region   = var.aws_region
  default_tags = local.common_tags
}

# Module for DynamoDB
module "database" {
  source         = "./modules/database"
  aws_region     = var.aws_region
  default_tags   = local.common_tags
  lambda_role_id = module.lambda.lambda_role_id
}

# Module for API Gateway
module "api" {
  source        = "./modules/api"
  lambda_arn    = module.lambda.lambda_function_arn
  aws_region    = var.aws_region
  default_tags  = local.common_tags
  function_name = module.lambda.function_name
}

# Module for Lambda
module "lambda" {
  source       = "./modules/lambda"
  aws_region   = var.aws_region
  default_tags = local.common_tags
}

# (Optional but Recommended) Create the actual Log Group in CloudWatch
# This allows you to control how long logs are kept (e.g., 7 days) to save money.
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/resume_counter"
  retention_in_days = 7
}
