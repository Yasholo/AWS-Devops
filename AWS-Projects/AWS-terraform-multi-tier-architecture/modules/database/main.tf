resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "db_instance" {
  identifier             = var.db_instance_name
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  parameter_group_name   = "default.mysql5.7"
  multi_az               = true
  engine_version         = "5.7"
  # name                 = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]

  skip_final_snapshot = true

  tags = {
    Name = var.db_instance_name
  }
}