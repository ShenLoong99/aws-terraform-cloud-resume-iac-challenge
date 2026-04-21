<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_cloudns"></a> [cloudns](#requirement\_cloudns) | ~> 1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_control.resume_oac](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [cloudns_dns_record.cert_validation](https://registry.terraform.io/providers/cloudns/cloudns/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name of the S3 bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cdn_arn"></a> [cdn\_arn](#output\_cdn\_arn) | The ARN of the CloudFront distribution |
| <a name="output_cloudfront_dist_id"></a> [cloudfront\_dist\_id](#output\_cloudfront\_dist\_id) | The ID of the CloudFront distribution |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | The URL of the CloudFront distribution |
<!-- END_TF_DOCS -->
