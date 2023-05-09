output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "public_subnet_a" {
  value = aws_subnet.public_subnet_a
}
output "public_subnet_b" {
  value = aws_subnet.public_subnet_b
}
output "private_subnet" {
  value = aws_subnet.private_subnet
}