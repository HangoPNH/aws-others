data "aws_route53_zone" "selected" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "rest_private_cname_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.rest_private}-nlb"
  type    = "CNAME"
  ttl     = 60
  records = [aws_lb.rest_private_nlb.dns_name]
}
