resource "aws_security_group" "allow_tls_security_group_public" {
  name   = "security-group-terraform-public"
  vpc_id = var.vpc_id

  tags = {
    Name = "security-group-terraform"
  }
}
