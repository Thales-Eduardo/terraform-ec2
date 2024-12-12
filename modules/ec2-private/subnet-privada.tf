resource "aws_subnet" "subnet_private" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet-Private-terraform"
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "route-table-private-terraform"
  }
}

resource "aws_route_table_association" "route_table_association_private" {
  subnet_id      = aws_subnet.subnet_private.id
  route_table_id = aws_route_table.route_table_private.id
}
