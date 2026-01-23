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
}

# Module for Cloudfront
module "cdn" {
  source       = "./modules/cdn"
  domain_name  = module.storage.domain_name
  aws_region   = var.aws_region
  default_tags = local.common_tags
}

# Module for IAM (Permissions, roles, policies)
module "iam" {
  source            = "./modules/iam"
  function_name     = module.lambda.function_name
  execution_arn     = module.api.execution_arn
  website_bucket_id = module.storage.website_bucket_id
  s3_arn            = module.storage.s3_arn
  cdn_arn           = module.cdn.cdn_arn
  db_arn            = module.database.db_arn
  aws_region        = var.aws_region
  default_tags      = local.common_tags
}

# Module for DynamoDB
module "database" {
  source       = "./modules/database"
  aws_region   = var.aws_region
  default_tags = local.common_tags
}

# Module for API Gateway
module "api" {
  source       = "./modules/api"
  lambda_arn   = module.lambda.lambda_arn
  aws_region   = var.aws_region
  default_tags = local.common_tags
}

# Module for Lambda
module "lambda" {
  source           = "./modules/lambda"
  lambda_arn       = module.iam.lambda_arn
  lambda_role_name = module.iam.lambda_role_name
  aws_region       = var.aws_region
  default_tags     = local.common_tags
}

# (Optional but Recommended) Create the actual Log Group in CloudWatch
# This allows you to control how long logs are kept (e.g., 7 days) to save money.
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/resume_counter"
  retention_in_days = 7
}
