# ingress
resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4_public" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  description       = "HTTPS"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ingress_SHH_ipv4_public" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = "0.0.0.0/0" # apenas para exemplo
  description       = "SSH"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_icmp_ipv4_ppublic" {
  security_group_id = aws_security_group.allow_tls_security_group_public.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  description       = "ICMP"
  ip_protocol       = "icmp"
  from_port         = -1
  to_port           = -1
}
