variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "db_subnet_grp_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "private_db_subnet1_id" {
  description = "ID of the first private DB subnet"
  type        = string
}

variable "private_db_subnet2_id" {
  description = "ID of the second private DB subnet"
  type        = string
}

variable "db_sg_id" {
  description = "ID of the security group for the DB"
  type        = string
}

variable "db_instance" {
  description = "Instance type for the DB instance"
  type        = string
}
