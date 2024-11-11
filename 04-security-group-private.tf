resource "aws_security_group" "allow_tls_security_group_private" {
  name   = "security-group-terraform-private"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "security-group-terraform-private"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_SHH_ipv4_private" {
  security_group_id = aws_security_group.allow_tls_security_group_private.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  description       = "SSH"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "ingress_icmp_ipv4_private" {
  security_group_id = aws_security_group.allow_tls_security_group_private.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  description       = "ICMP"
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}

resource "aws_vpc_security_group_egress_rule" "allow_all_SHH_ipv4_private" {
  security_group_id = aws_security_group.allow_tls_security_group_private.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  description       = "SSH"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}
