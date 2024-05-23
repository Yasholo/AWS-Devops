variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet1_name" {
  description = "Name for the first public subnet"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "public_subnet2_name" {
  description = "Name for the second public subnet"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet1_name" {
  description = "Name for the first private subnet"
  type        = string
}

variable "private_subnet2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "private_subnet2_name" {
  description = "Name for the second private subnet"
  type        = string
}

variable "private_db_subnet1_cidr" {
  description = "CIDR block for the first private database subnet"
  type        = string
}

variable "private_db_subnet1_name" {
  description = "Name for the first private database subnet"
  type        = string
}

variable "private_db_subnet2_cidr" {
  description = "CIDR block for the second private database subnet"
  type        = string
}

variable "private_db_subnet2_name" {
  description = "Name for the second private database subnet"
  type        = string
}

variable "az_1" {
  description = "Availability zone for the first set of subnets"
  type        = string
}

variable "az_2" {
  description = "Availability zone for the second set of subnets"
  type        = string
}

variable "igw_name" {
  description = "Name of the internet gateway"
  type        = string
}

variable "nat_gw_name" {
  description = "Name of the NAT gateway"
  type        = string
}
