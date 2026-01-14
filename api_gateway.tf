# THE API GATEWAY (HTTP API)
resource "aws_apigatewayv2_api" "resume_api_gw" {
  name          = "resume-api-gw"
  protocol_type = "HTTP"

  # This allows your website to talk to the API from a different domain
  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["GET", "POST", "OPTIONS"]
    allow_headers = ["content-type"]
  }
}

# THE STAGE (The "environment" - e.g., prod or dev)
resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.resume_api_gw.id
  name        = "$default"
  auto_deploy = true
}

# THE INTEGRATION (Connecting Gateway to Lambda)
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.resume_api_gw.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.resume_api.invoke_arn
}

# THE ROUTE (Creating the /getcount endpoint)
resource "aws_apigatewayv2_route" "api_route" {
  api_id    = aws_apigatewayv2_api.resume_api_gw.id
  route_key = "GET /getcount"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# PERMISSION (Allowing API Gateway to call Lambda)
resource "aws_lambda_permission" "api_gw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.resume_api.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.resume_api_gw.execution_arn}/*/*"
}