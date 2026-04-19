variable "env" {
    description = "this is env variable"
    type        = string
}

variable "cidr" {
    description = "cidr for vpc"
    type        = string
}

variable "azs" {
    description = "AZs"
    type        =  list(string)
}

variable "private_subnets" {
    description = "private subnet ip range"
    type        = list(string) 
}

variable "public_subnets" {
    description = "public subnet ip range"
    type        = list(string) 
}
