# Define the permission policy
data "aws_iam_policy_document" "route53_query_logging_policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:us-east-1:*:log-group:/aws/route53/*"]

    principals {
      identifiers = ["route53.amazonaws.com"]
      type        = "Service"
    }
  }
}

# This requests the certificate
resource "aws_acm_certificate" "cert" {
  provider          = aws.us-east-1
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# This automatically creates the DNS record in Route 53
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.primary.zone_id
}

# This waits for AWS to see the record and issue the cert
resource "aws_acm_certificate_validation" "cert" {
  provider                = aws.us-east-1
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

# Hosted zone for the domain
resource "aws_route53_zone" "primary" {
  name = var.domain_name

  lifecycle {
    create_before_destroy = true
  }
}

# Add A record to point to CloudFront distribution
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Apply the policy to CloudWatch
resource "aws_cloudwatch_log_resource_policy" "route53_query_logging_policy" {
  provider        = aws.us-east-1
  policy_document = data.aws_iam_policy_document.route53_query_logging_policy.json
  policy_name     = "route53-query-logging-policy"
}

resource "aws_cloudwatch_log_group" "route53_logs" {
  provider          = aws.us-east-1
  name              = "/aws/route53/${var.domain_name}"
  retention_in_days = 7
}

resource "aws_route53_query_log" "main" {
  cloudwatch_log_group_arn = aws_cloudwatch_log_group.route53_logs.arn
  zone_id                  = aws_route53_zone.primary.zone_id
}
