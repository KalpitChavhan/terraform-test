output "dev_ec2_public_ip" {
  value = module.infra_dev.public_ip
}

output "dev_ec2_public_dns" {
  value = module.infra_dev.public_dns
}

output "stage_ec2_public_ip" {
  value = module.infra_stage.public_ip
}

output "stage_ec2_public_dns" {
  value = module.infra_stage.public_dns
}

output "prod_ec2_public_ip" {
  value = module.infra_prod.public_ip
}

output "prod_ec2_public_dns" {
  value = module.infra_prod.public_dns
}