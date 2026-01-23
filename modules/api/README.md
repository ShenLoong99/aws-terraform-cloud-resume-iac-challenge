<!-- BEGIN_TF_DOCS -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Extra tags to pass to the provider | `map(string)` | n/a | yes |
| <a name="input_lambda_arn"></a> [lambda\_arn](#input\_lambda\_arn) | The ARN of the Lambda function | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_url"></a> [api\_url](#output\_api\_url) | The URL of the API Gateway |
| <a name="output_execution_arn"></a> [execution\_arn](#output\_execution\_arn) | Execution arn of the API Gateway |
## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.resume_api_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_integration.lambda_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route.api_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_apigatewayv2_stage.api_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
<!-- END_TF_DOCS -->
