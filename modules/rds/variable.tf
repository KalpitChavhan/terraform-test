variable "env" {
    description = "env"
    type        =  string
}

variable "subnet_group" {
    description = "subnet group"
    type        = string  
}

variable "private_subnets" {
    description = "private subnets"
    type = list(string) 
}