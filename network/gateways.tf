resource "aws_eip" "nat_elastic_ip" {
  vpc = true
  tags = {
    Name = "Public IP - Jahaziel -to Nat"
  }
}

resource "aws_nat_gateway" "ngw" {
  depends_on = [aws_internet_gateway.igw]

  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet_a.id
  tags = {
    Name = "Nat Gateway - Jahaziel - ${var.lab_name}"
  }
}