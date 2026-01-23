output "api_url" {
  description = "The URL of the API Gateway"
  value       = "${aws_apigatewayv2_api.resume_api_gw.api_endpoint}/getcount"
}

output "execution_arn" {
  description = "Execution arn of the API Gateway"
  value       = aws_apigatewayv2_api.resume_api_gw.execution_arn
}
