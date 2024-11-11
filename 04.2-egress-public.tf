# egress
resource "aws_vpc_security_group_egress_rule" "allow_all_https_ipv4_public" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_http_ipv4_public" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_icmp_ipv4_public" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}

resource "aws_vpc_security_group_egress_rule" "allow_all_SHH_ipv4_public" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  description       = "SSH"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}
