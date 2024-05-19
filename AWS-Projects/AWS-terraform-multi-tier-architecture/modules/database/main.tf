# Create RDS MySQL instance
resource "aws_db_instance" "database" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  multi_az             = true
  instance_class       = var.db_instance
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.subnet_grp.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  parameter_group_name = "default.mysql5.7"
}

# Create Database Security Group
resource "aws_security_group" "db_sg" {
  name        = var.db_sg_name
  description = "Database Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.asg_app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_sg_name
  }
}

# Create Database Subnet Group
resource "aws_db_subnet_group" "subnet_grp" {
  name       = var.db_subnet_grp_name
  subnet_ids = [aws_subnet.private_db_subnet_1.id, aws_subnet.private_db_subnet_2.id]

  tags = {
    Name = var.db_subnet_grp_name
  }
}


# In this rewritten database/main.tf file:

#    The resources related to RDS MySQL instance, database security group, and database subnet group are grouped together.
#    Each resource is clearly defined with appropriate descriptions and tags.
#    Dependencies between resources are maintained properly.
#    The code is organized for better readability and maintainability.