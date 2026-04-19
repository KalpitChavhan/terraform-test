  resource "aws_key_pair" "keypair" {
    key_name = "${var.env}-keypair"
    public_key = file(var.public_key_path)

    tags = {
        environment = var.env
        Name = "${var.env}-keypair"
    }
}


resource "aws_security_group" "sg" {
  name        = "${var.env}-security-group-module"
  description = "security group for module"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        Name = "${var.env}-security-group-module"
  }
}

resource "aws_instance" "module_instance" {
    depends_on      = [aws_key_pair.keypair, aws_security_group.sg]
    count           = var.ec2_number
    ami             = var.ami_id
    instance_type   = var.instance_type
    subnet_id       = var.subnet_ids[0]
    vpc_security_group_ids = [aws_security_group.sg.id]

    root_block_device {
        volume_size = var.env == "prod" ? 20 : 10
        volume_type = var.ec2_root_block_device.volume_type
    }

    tags = {
        Name = "${var.env}-instance-${count.index}"
        Environment = var.env
    }
}
  

