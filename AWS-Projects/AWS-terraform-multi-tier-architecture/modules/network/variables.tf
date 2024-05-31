variable "region_name" {
  description = "The region where AWS resources will be created."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "igw_name" {
  description = "The name of the Internet Gateway."
  type        = string
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the first public subnet."
  type        = string
}

variable "public_subnet1_name" {
  description = "The name tag for the first public subnet."
  type        = string
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the second public subnet."
  type        = string
}

variable "public_subnet2_name" {
  description = "The name tag for the second public subnet."
  type        = string
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for the first private subnet."
  type        = string
}

variable "private_subnet1_name" {
  description = "The name tag for the first private subnet."
  type        = string
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for the second private subnet."
  type        = string
}

variable "private_subnet2_name" {
  description = "The name tag for the second private subnet."
  type        = string
}

variable "private_db_subnet1_cidr" {
  description = "The CIDR block for the first private database subnet."
  type        = string
}

variable "private_db_subnet1_name" {
  description = "The name tag for the first private database subnet."
  type        = string
}

variable "private_db_subnet2_cidr" {
  description = "The CIDR block for the second private database subnet."
  type        = string
}

variable "private_db_subnet2_name" {
  description = "The name tag for the second private database subnet."
  type        = string
}

variable "az_1" {
  description = "The availability zone for the first subnet."
  type        = string
}

variable "az_2" {
  description = "The availability zone for the second subnet."
  type        = string
}

variable "public_rt_name" {
  description = "The name tag for the public route table."
  type        = string
}

variable "private_rt_name" {
  description = "The name tag for the private route tables."
  type        = string
}
