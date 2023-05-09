resource "aws_security_group" "allow_ssh_bastion" {
  name        = "Allow_ssh_bastion-jahaziel"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    description = "allow_ssh"
    from_port   = 22
    to_port     = 22
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
    Name = "Allow SSH to Bastion - Jahaziel"
  }
}