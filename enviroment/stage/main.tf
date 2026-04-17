module "infra_stage" {
    source = "terraform-aws-infra/enviroment/dev/main.tf/modules"
    env = "stage"
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "stage"
        volume_type = "gp3" 
    }
}

