resource "aws_lb_target_group" "tgWebserver" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb" "albWebserver" {
  name               = "${var.lb_instance_name}-${var.lab_name}"
  load_balancer_type = var.load_balancer_type
  internal           = var.lb_internal
  subnets            = var.lb_subnets
  security_groups    = var.lb_security_groups
}

resource "aws_lb_listener" "listener_80_webserver" {
  load_balancer_arn = aws_lb.albWebserver.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tgWebserver.arn

    # Opcional: redirect 443
    # type = "redirect"

    # redirect {
    #   port        = "443"
    #   protocol    = "HTTPS"
    #   status_code = "HTTP_301"
    # }
  }
}