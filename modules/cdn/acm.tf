# The Certificate Request
resource "aws_acm_certificate" "cert" {
  provider          = aws.us-east-1
  domain_name       = "portfolio.tansikai-cloud-resume.abrdns.com"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# DNS Record
resource "cloudns_dns_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name  = each.value.name
  value = each.value.record
  type  = each.value.type
  zone  = "tansikai-cloud-resume.abrdns.com"
  ttl   = "3600"
}

# The Validation Waiter
resource "aws_acm_certificate_validation" "cert" {
  provider        = aws.us-east-1
  certificate_arn = aws_acm_certificate.cert.arn
  # This tells Terraform to wait until the records are visible
  validation_record_fqdns = [for record in cloudns_dns_record.cert_validation : record.name]
}
