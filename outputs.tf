#output "aws_ami_id" {
#  value = data.aws_ami.ubuntu.id
#}
output "aws_key_pair" {
  value = aws_key_pair.ec2_key.key_name
}
output "ec2_bastion_public_ip" {
  value = module.ec2.associate_public_ip_address
}
#output "aws_loadb_arn"{
#  value = module.targetGroup.albWebserver.arn.id
#}

output "connection_to_bastion" {
  value       = "ssh -i key.pem ubuntu@${module.ec2.associate_public_ip_address}"
  description = "bastion SSH"
}

output "albWebserver_dns_name" {
  value = module.loadBalancer.albWebserver.dns_name
}