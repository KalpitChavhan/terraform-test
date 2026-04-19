module "infra_dev" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/ec2"
    env = "dev"
    public_key_path = "E:/edu/terraform/terraform-aws-infra/modules/keypair.pub"
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "dev"
        volume_type = "gp3" 
    }
}

module "vpc" {
  source = "E:/edu/terraform/terraform-aws-infra/modules/vpc"
  env = "dev"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
}


module "alb" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/alb"
    env    = "dev"
    vpc_id = module.vpc.vpc_id
    public_subnets = module.vpc.public_subnets
    sg_id         = module.infra_dev.sg_id
    instance_ids   = module.infra_dev.instance_ids
}

module "rds" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/rds"
    env    = "dev"
    subnet_group = module.vpc.private_subnets[0]
    private_subnets = module.vpc.private_subnets
}