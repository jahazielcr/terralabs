resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.lab_name}.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [var.albWebserver.dns_name]
}