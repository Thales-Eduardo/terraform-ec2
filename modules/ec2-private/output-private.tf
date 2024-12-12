output "vm-private_ip" {
  description = "ip da maquina virtual privada"
  value       = aws_instance.vm-private.public_ip
}

output "subnet_private_id" {
  description = "id da subnet"
  value       = aws_subnet.subnet_private.id
}
