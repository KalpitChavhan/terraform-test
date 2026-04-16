module "infra_dev" {
    source = "./modules"
    env = "dev"
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "dev"
        volume_type = "gp3" 
    }
}

module "infra_prod" {
    source = "./modules"
    env = "prod"
    instance_type = "t3.small"
    ami_id = "ami-05d2d839d4f73aafb"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "dev"
        volume_type = "gp3" 
    }
}

module "infra_stage" {
    source = "./modules"
    env = "stage"
    instance_type = "t3.micro"
    ami_id = "ami-03793655b06c6e29a"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "dev"
        volume_type = "gp3" 
    }
}