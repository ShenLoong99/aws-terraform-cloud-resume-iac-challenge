output "lambda_arn" {
  value = aws_lambda_function.resume_api.arn
}

output "api_url" {
  value = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.resume_bucket.bucket
}

output "resume_url" {
  value = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}