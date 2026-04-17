module "infra_dev" {
    source = "E:/edu/terraform/terraform-aws-infra/modules"
    env = "dev"
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "dev"
        volume_type = "gp3" 
    }
}
