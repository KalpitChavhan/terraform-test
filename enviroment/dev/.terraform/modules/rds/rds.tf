resource "aws_db_instance" "db" {
    identifier           = "${var.env}-db"
    engine               = "mysql"
    instance_class       = "db.t3.micro"
    allocated_storage    = 20
    username             = "db_admin"
    password             = "password123"
    db_subnet_group_name = aws_db_subnet_group.db_subnet.name
    skip_final_snapshot  = true 
}

resource "aws_db_subnet_group" "db_subnet" {
    name = "${var.env}-db_subnet_group"
    subnet_ids = var.private_subnets

    tags = {
     name = "${var.env}-db_subnet_group"
    }

  
}