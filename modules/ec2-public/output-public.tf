output "subnet_public_id" {
  description = "id da subnet"
  value       = aws_subnet.subnet_public.id
}

output "security_group_id" {
  description = "id da security_group"
  value       = aws_security_group.allow_tls_security_group_public.id
}

output "vm-public_ip" {
  description = "ip da maquina virtual pública para usar no ssh"
  value       = aws_instance.vm-public.public_ip
}

