output "associate_public_ip_address" {
  value = aws_instance.ec2-jc.public_ip
}