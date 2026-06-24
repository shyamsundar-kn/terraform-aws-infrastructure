output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}

output "private_ec2_ip" {
  value = module.ec2.private_ec2_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
