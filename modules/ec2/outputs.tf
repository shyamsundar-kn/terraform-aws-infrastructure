output "bastion_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "private_ec2_private_ip" {
  value = aws_instance.private_ec2.private_ip
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}
