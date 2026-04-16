variable "env" {
    description = "this is env variable"
    type        = string
}

variable "instance_type" {
    description = "instance type"
    type        = string
}

variable "ami_id"{
    description = "ami id"
    type        = string 
}   
  
variable "ec2_number" {
    description = "ec2 number"
    type        = number
}

variable  ec2_root_block_device {
    description = "this os root block device"
    type        =  object(
        {
        Environment = string
        volume_type = string
        }
    )
}

  