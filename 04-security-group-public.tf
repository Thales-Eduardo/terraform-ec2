resource "aws_security_group" "allow_tls_security_group_public" {
  name   = "security-group-terraform-public"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "security-group-terraform"
  }
}
