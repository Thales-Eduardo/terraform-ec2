resource "aws_instance" "vm-private" {
  ami                         = "ami-063d43db0594b521b"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key-pair-shh.key_name
  subnet_id                   = aws_subnet.subnet_private.id
  vpc_security_group_ids      = [aws_security_group.allow_tls_security_group_private.id]
  associate_public_ip_address = false # ip public

  tags = {
    Name = "vm-terraform-private"
  }
}
