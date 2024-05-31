variable "region_name" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "multi-tier-vpc"
}

variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  type        = string
  default     = "multi-tier-igw"
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet1_name" {
  description = "The name tag for the first public subnet"
  type        = string
  default     = "multi-tier-web-subnet-1"
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet2_name" {
  description = "The name tag for the second public subnet"
  type        = string
  default     = "multi-tier-web-subnet-2"
}

variable "private_subnet1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet1_name" {
  description = "The name tag for the first private subnet"
  type        = string
  default     = "multi-tier-app-subnet-1"
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_subnet2_name" {
  description = "The name tag for the second private subnet"
  type        = string
  default     = "multi-tier-app-subnet-2"
}

variable "private_db_subnet1_cidr" {
  description = "The CIDR block for the first private database subnet"
  type        = string
  default     = "10.0.5.0/24"
}

variable "private_db_subnet1_name" {
  description = "The name tag for the first private database subnet"
  type        = string
  default     = "multi-tier-db-subnet-1"
}

variable "private_db_subnet2_cidr" {
  description = "The CIDR block for the second private database subnet"
  type        = string
  default     = "10.0.6.0/24"
}

variable "private_db_subnet2_name" {
  description = "The name tag for the second private database subnet"
  type        = string
  default     = "multi-tier-db-subnet-2"
}

variable "az_1" {
  description = "The availability zone for the first subnet"
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "The availability zone for the second subnet"
  type        = string
  default     = "us-east-1b"
}

variable "public_rt_name" {
  description = "The name tag for the public route table"
  type        = string
  default     = "multi-tier-public-route-table"
}

variable "private_rt_name" {
  description = "The name tag for the private route table"
  type        = string
  default     = "multi-tier-private-route-table"
}
