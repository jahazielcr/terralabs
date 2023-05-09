resource "aws_security_group" "allow_http_public" {
  name        = "Allow_http - Jahaziel"
  description = "Allow http inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "allow_http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "Allow Public HTTP Trafic - Jahaziel"
  }
}

resource "aws_security_group" "allow_https_public" {
  name        = "Allow_https - Jahaziel"
  description = "Allow https inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "allow_https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "Allow Public HTTPS Trafic - Jahaziel"
  }
}