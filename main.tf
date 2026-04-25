# Module for S3
module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
  cdn_arn      = module.cdn.cdn_arn
}

# Module for Cloudfront
module "cdn" {
  source = "./modules/cdn"
  providers = {
    aws           = aws
    aws.us-east-1 = aws.us-east-1
  }
  domain_name     = var.domain_name
  route53_zone_id = var.route53_zone_id
}

# Module for DynamoDB
module "database" {
  source         = "./modules/database"
  lambda_role_id = module.lambda.lambda_role_id
}

# Module for API Gateway
module "api" {
  source        = "./modules/api"
  lambda_arn    = module.lambda.lambda_function_arn
  function_name = module.lambda.function_name
}

# Module for Lambda
module "lambda" {
  source = "./modules/lambda"
}

# (Optional but Recommended) Create the actual Log Group in CloudWatch
# This allows you to control how long logs are kept (e.g., 7 days) to save money.
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/resume_counter"
  retention_in_days = 7
}
