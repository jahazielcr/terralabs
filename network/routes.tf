resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Internet Gateway - Jahaziel - ${var.lab_name}"
  }
}

resource "aws_route_table" "rt_igw" {
  depends_on = [aws_internet_gateway.igw, aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id
  tags = {
    Name = "RT to Internet Gw - Jahaziel - ${var.lab_name}"
  }
}

# route from 0.0.0.0/0 to igw
resource "aws_route" "publicRoute" {
  depends_on             = [aws_route_table.rt_igw]
  route_table_id         = aws_route_table.rt_igw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id


}

# associations
resource "aws_route_table_association" "public_subnet_association_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.rt_igw.id
}
resource "aws_route_table_association" "public_subnet_association_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.rt_igw.id
}

# route table
resource "aws_route_table" "rt_nat" {
  depends_on = [aws_vpc.vpc, aws_nat_gateway.ngw]

  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "RT to NatGw - Jahaziel - ${var.lab_name}"
  }
}

# route from 0.0.0.0/0 to igw
resource "aws_route" "routeNat" {
  depends_on = [aws_route_table.rt_nat]

  route_table_id         = aws_route_table.rt_nat.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.ngw.id


}

# associations
resource "aws_route_table_association" "private_subnet_association_a" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.rt_nat.id
}