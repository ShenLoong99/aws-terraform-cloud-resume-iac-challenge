# The Certificate Request
resource "aws_acm_certificate" "cert" {
  provider          = aws.us-east-1
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# Create the DNS records in Route 53 for ACM Validation
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
  zone_id         = var.route53_zone_id
}

# The Validation Waiter
resource "aws_acm_certificate_validation" "cert" {
  provider        = aws.us-east-1
  certificate_arn = aws_acm_certificate.cert.arn
  # Route 53 uses 'fqdn' as the attribute name
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
