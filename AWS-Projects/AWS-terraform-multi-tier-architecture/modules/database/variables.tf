variable "db_subnet_group_name" {
  description = "The name of the database subnet group."
  type        = string
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for the database subnet group."
  type        = list(string)
}

variable "db_instance_name" {
  description = "The name of the database instance."
  type        = string
}

variable "db_engine" {
  description = "The database engine (e.g., MySQL, PostgreSQL)."
  type        = string
}

variable "db_instance_class" {
  description = "The instance type of the database instance."
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes."
  type        = number
}

variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
}

variable "db_security_group_id" {
  description = "The security group ID for the database."
  type        = string
}
