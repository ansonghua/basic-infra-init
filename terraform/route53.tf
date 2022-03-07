# Route 53 for domain
# resource "aws_route53_zone" "main" {
#   name = var.domain_name
#   tags = var.common_tags
# }

data "aws_route53_zone" "main" {
  name = "christmaslocker.com."
}

resource "aws_route53_record" "root-a" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.asap_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.asap_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-a" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_asap_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_asap_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

