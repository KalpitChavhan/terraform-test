module "infra_dev" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/ec2"
    env = "dev"
    public_key_path = "E:/edu/terraform/terraform-aws-infra/modules/keypair.pub"
    vpc_id = module.vpc_dev.vpc_id
    subnet_ids = module.vpc_dev.public_subnets
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "dev"
        volume_type = "gp3" 
    }
}

module "vpc_dev" {
  source = "E:/edu/terraform/terraform-aws-infra/modules/vpc"
  env = "dev"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
}


module "alb_dev" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/alb"
    env    = "dev"
    vpc_id = module.vpc_dev.vpc_id
    public_subnets = module.vpc_dev.public_subnets
    sg_id         = module.infra_dev.sg_id
    instance_ids   = module.infra_dev.instance_ids
}

module "rds_dev" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/rds"
    env    = "dev"
    subnet_group = module.vpc_dev.private_subnets[0]
    private_subnets = module.vpc_dev.private_subnets
}


module "infra_prod" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/ec2"
    env = "prod"
    public_key_path = "E:/edu/terraform/terraform-aws-infra/modules/keypair.pub"
    vpc_id = module.vpc_prod.vpc_id
    subnet_ids = module.vpc_prod.public_subnets
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "prod"
        volume_type = "gp3" 
    }
}

module "vpc_prod" {
  source = "E:/edu/terraform/terraform-aws-infra/modules/vpc"
  env = "prod"
  cidr = "10.1.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24"]
}


module "alb_prod" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/alb"
    env    = "prod"
    vpc_id = module.vpc_prod.vpc_id
    public_subnets = module.vpc_prod.public_subnets
    sg_id         = module.infra_prod.sg_id
    instance_ids   = module.infra_prod.instance_ids
}

module "rds_prod" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/rds"
    env    = "prod"
    subnet_group = module.vpc_prod.private_subnets[0]
    private_subnets = module.vpc_prod.private_subnets
}

module "infra_stage" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/ec2"
    env = "stage"
    public_key_path = "E:/edu/terraform/terraform-aws-infra/modules/keypair.pub"
    vpc_id = module.vpc_stage.vpc_id
    subnet_ids = module.vpc_stage.public_subnets
    instance_type = "t3.micro"
    ami_id = "ami-0e12ffc2dd465f6e4"
    ec2_number = 2
    ec2_root_block_device = {
        Environment = "stage"
        volume_type = "gp3" 
    }
}

module "vpc_stage" {
  source = "E:/edu/terraform/terraform-aws-infra/modules/vpc"
  env = "stage"
  cidr = "10.2.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]
  public_subnets  = ["10.2.101.0/24", "10.2.102.0/24"]
}


module "alb_stage" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/alb"
    env    = "stage"
    vpc_id = module.vpc_stage.vpc_id
    public_subnets = module.vpc_stage.public_subnets
    sg_id         = module.infra_stage.sg_id
    instance_ids   = module.infra_stage.instance_ids
}

module "rds_stage" {
    source = "E:/edu/terraform/terraform-aws-infra/modules/rds"
    env    = "stage"
    subnet_group = module.vpc_stage.private_subnets[0]
    private_subnets = module.vpc_stage.private_subnets
}