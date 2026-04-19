output "public_ip" {
  value = aws_instance.module_instance[*].public_ip
}

output "public_dns" {
  value = aws_instance.module_instance[*].public_dns
}

output "sg_id" {
  value = aws_security_group.sg.id 
}

output "instance_ids" {
  value = aws_instance.module_instance[*].id
}