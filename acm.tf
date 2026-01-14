# Commented out due to not implementing a custom domain
# # ACM Certificate for your domain
# resource "aws_acm_certificate" "cert" {
#     provider          = aws.us-east-1 # CloudFront requires ACM in us-east-1
#   domain_name       = "my-resume.com"
#   validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Validate the ACM Certificate using Route53 DNS records
# resource "aws_acm_certificate_validation" "cert" {
#   provider                = aws.us-east-1
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
# }