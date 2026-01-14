# Generate a random string suffix for the S3 bucket name to ensure uniqueness
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Create the S3 Bucket to host the resume website
resource "aws_s3_bucket" "resume_bucket" {
  bucket        = "${var.project_name}-${random_string.bucket_suffix.result}"
  force_destroy = true
}

# SECURITY: Enable versioning to protect against accidental deletes
resource "aws_s3_bucket_versioning" "resume_versioning" {
  bucket = aws_s3_bucket.resume_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# COST: Transition old versions to cheaper storage after 30 days
resource "aws_s3_bucket_lifecycle_configuration" "resume_lifecycle" {
  bucket = aws_s3_bucket.resume_bucket.id
  rule {
    id     = "archive-old-versions"
    status = "Enabled"
    filter {}
    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "GLACIER"
    }
  }
}

# SECURITY: Explicitly block all public access (Best Practice with CloudFront OAC)
resource "aws_s3_bucket_public_access_block" "resume_block" {
  bucket = aws_s3_bucket.resume_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Commented out to use GitHub Actions for uploading website files
# Upload the index.html file to the S3 Bucket
# resource "aws_s3_object" "index" {
#   bucket       = aws_s3_bucket.resume_bucket.id
#   key          = "index.html"
#   content_type = "text/html"

#   # INJECTING VARIABLES HERE
#   content = templatefile("${path.module}/website-files/index.html", {
#     api_url            = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
#     github_repo_url    = "https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge"
#     github_profile_url = "https://github.com/ShenLoong99"
#     linkedin_url       = "https://www.linkedin.com/in/si-kai-tan/"
#     email_address      = "tansikai554@gmail.com"
#   })

#   # Forces an update if content changes 
#   etag = md5(templatefile("${path.module}/website-files/index.html", {
#     api_url            = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
#     github_repo_url    = "https://github.com/ShenLoong99/aws-terraform-cloud-resume-iac-challenge"
#     github_profile_url = "https://github.com/ShenLoong99"
#     linkedin_url       = "https://www.linkedin.com/in/si-kai-tan/"
#     email_address      = "tansikai554@gmail.com"
#   }))
# }