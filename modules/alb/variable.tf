variable "env" {
    description = "env"
    type        = string
}

variable "vpc_id" {
    description = "vpc id"
    type        =  string
}

variable "public_subnets" {
    description = "value"
    type        =  list(string)
}

variable "sg_id" {
    description = "sg groups"
    type        =  string
}

variable "instance_ids" {
    description = "gives instance id"
    type        = list(string)
}