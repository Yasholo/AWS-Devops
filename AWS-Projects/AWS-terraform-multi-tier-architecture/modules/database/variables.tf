variable "db_instance" {
  description = "The instance class for the RDS MySQL instance"
  type        = string
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_sg_name" {
  description = "Name of the Database Security Group"
  type        = string
}

variable "db_subnet_grp_name" {
  description = "Name of the Database Subnet Group"
  type        = string
}
