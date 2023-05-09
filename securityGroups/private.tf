resource "aws_security_group" "allow_ssh_from_bastion" {
  name        = "Allow_ssh_from_bastion - Jahaziel"
  description = "Allow ssh from bastion"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow_ssh_from_bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh_bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH Trafic from Bastion - Jahaziel"
  }
}

resource "aws_security_group" "allow_http_from_bastion" {
  name        = "Allow_http_from_bastion - Jahaziel"
  description = "Allow http inbound traffic from Bastion"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow_http"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh_bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP Trafic From Bastion - Jahaziel"
  }

}

resource "aws_security_group" "allow_https_from_bastion" {
  name        = "Allow_https_from_bastion - Jahaziel"
  description = "Allow https inbound traffic from Bastion"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow_https"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh_bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "Allow HTTPS Trafic From Bastion - Jahaziel"
  }
}