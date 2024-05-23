# RDS Subnet Group
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_grp_name
  subnet_ids = [var.private_db_subnet1_id, var.private_db_subnet2_id]
  description = "Subnet group for RDS instances"

  tags = {
    Name = var.db_subnet_grp_name
  }
}

# RDS Instance
resource "aws_db_instance" "db_instance" {
  identifier              = var.db_name
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [var.db_sg_id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = {
    Name = var.db_name
  }
}
