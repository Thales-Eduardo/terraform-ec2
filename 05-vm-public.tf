resource "aws_instance" "vm-public" {
  ami                         = "ami-063d43db0594b521b"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key-pair-shh.key_name
  subnet_id                   = aws_subnet.subnet_public.id
  vpc_security_group_ids      = [aws_security_group.allow_tls_security_group_public.id]
  associate_public_ip_address = true # ip public

  tags = {
    Name = "vm-terraform-public"
  }
}

# resource "aws_eip" "ip_elastico" {
#   instance   = aws_instance.vm-public.id
#   domain     = "vpc"
#   depends_on = [aws_internet_gateway.internet_gateway]

#   tags = {
#     Name = "ip_elastico-terraform"
#   }
# }

# resource "aws_route53_zone" "main" {
#   name = "thalesdev.com.br"
# }

# resource "aws_route53_record" "www_record" {
#   zone_id    = aws_route53_zone.main.zone_id
#   name       = "thalesdev.com.br"
#   type       = "A"
#   ttl        = 300
#   records    = [aws_eip.ip_elastico.public_ip]
#   depends_on = [aws_eip.ip_elastico]
# }
