output "bastion_security_group_id" {
  value = aws_security_group.allow_ssh_bastion.id
}

output "public_http_security_group_id" {
  value = aws_security_group.allow_http_public.id
}

output "public_https_security_group_id" {
  value = aws_security_group.allow_https_public.id
}

output "private_allow_ssh_from_bastion_id" {
  value = aws_security_group.allow_ssh_from_bastion.id
}

output "private_allow_http_from_bastion_id" {
  value = aws_security_group.allow_http_from_bastion.id
}

output "private_allow_https_from_bastion_id" {
  value = aws_security_group.allow_https_from_bastion.id
}