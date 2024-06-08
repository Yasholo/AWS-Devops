variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

# Network Variables
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
  description = "The name of the first public subnet."
  type        = string
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the second public subnet."
  type        = string
}

variable "public_subnet2_name" {
  description = "The name of the second public subnet."
  type        = string
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for the first private subnet."
  type        = string
}

variable "private_subnet1_name" {
  description = "The name of the first private subnet."
  type        = string
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for the second private subnet."
  type        = string
}

variable "private_subnet2_name" {
  description = "The name of the second private subnet."
  type        = string
}

variable "private_db_subnet1_cidr" {
  description = "The CIDR block for the first private database subnet."
  type        = string
}

variable "private_db_subnet1_name" {
  description = "The name of the first private database subnet."
  type        = string
}

variable "private_db_subnet2_cidr" {
  description = "The CIDR block for the second private database subnet."
  type        = string
}

variable "private_db_subnet2_name" {
  description = "The name of the second private database subnet."
  type        = string
}

variable "public_rt_name" {
  description = "The name of the public route table."
  type        = string
}

variable "private_rt_name" {
  description = "The name of the private route table."
  type        = string
}

variable "nat_gw_name" {
  description = "Name for NAT Gateway"
}

variable "az_1" {
  description = "The first availability zone."
  type        = string
}

variable "az_2" {
  description = "The second availability zone."
  type        = string
}