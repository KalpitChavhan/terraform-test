module "infra_prod" {
    source = "terraform-aws-infra/enviroment/dev/main.tf/modules"
    env = "prod"
    instance_type = "t3.small"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "prod"
        volume_type = "gp3" 
    }
}
