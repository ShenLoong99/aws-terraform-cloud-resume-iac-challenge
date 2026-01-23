<!-- BEGIN_TF_DOCS -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_cdn_arn"></a> [cdn\_arn](#input\_cdn\_arn) | The ARN of the CloudFront distribution | `string` | n/a | yes |
| <a name="input_db_arn"></a> [db\_arn](#input\_db\_arn) | The ARN of DynamoDB table | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Extra tags to pass to the provider | `map(string)` | n/a | yes |
| <a name="input_execution_arn"></a> [execution\_arn](#input\_execution\_arn) | Execution arn of the API Gateway | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The function name of the lambda | `string` | n/a | yes |
| <a name="input_s3_arn"></a> [s3\_arn](#input\_s3\_arn) | ARN of the S3 bucket | `string` | n/a | yes |
| <a name="input_website_bucket_id"></a> [website\_bucket\_id](#input\_website\_bucket\_id) | The id of the S3 bucket | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | The ARN of the Lambda function |
| <a name="output_lambda_role_name"></a> [lambda\_role\_name](#output\_lambda\_role\_name) | The name of the IAM role for the Lambda |
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.lambda_db_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_permission.api_gw_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket_policy.allow_access_from_cloudfront](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
<!-- END_TF_DOCS -->
