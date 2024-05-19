variable "region_name" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type for your instances"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for your instances"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The name of the EC2 key pair to use for SSH access"
  type        = string
  default     = "Jobs"
}

variable "app_instance_name" {
  description = "The name tag for application instances"
  type        = string
  default     = "multi-tier-app-instances"
}

variable "web_instance_name" {
  description = "The name tag for web instances"
  type        = string
  default     = "multi-tier-web-instances"
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

variable "nat_gw_name" {
  description = "The name tag for the NAT Gateway"
  type        = string
  default     = "multi-tier-nat-gw"
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

variable "alb_web" {
  description = "The name tag for the web application load balancer"
  type        = string
  default     = "multi-tier-web-alb"
}

variable "alb_sg_web_name" {
  description = "The name tag for the web application load balancer security group"
  type        = string
  default     = "multi-tier-alg-sg-web"
}

variable "asg_sg_web_name" {
  description = "The name tag for the web auto scaling group security group"
  type        = string
  default     = "multi-tier-asg-sg-web"
}

variable "alb_app" {
  description = "The name tag for the application load balancer"
  type        = string
  default     = "multi-tier-app-lb"
}

variable "alb_sg_app_name" {
  description = "The name tag for the application load balancer security group"
  type        = string
  default     = "multi-tier-alg-sg-app"
}

variable "asg_sg_app_name" {
  description = "The name tag for the application auto scaling group security group"
  type        = string
  default     = "multi-tier-asg-sg-app"
}

variable "web_tg_name" {
  description = "The name tag for the web target group"
  type        = string
  default     = "multi-tier-web-target-group"
}

variable "app_tg_name" {
  description = "The name tag for the application target group"
  type        = string
  default     = "multi-tier-app-target-group"
}

variable "asg_app_name" {
  description = "The name tag for the application auto scaling group"
  type        = string
  default     = "multi-tier-auto-scaling-grp-app"
}

variable "asg_web_name" {
  description = "The name tag for the web auto scaling group"
  type        = string
  default     = "multi-tier-auto-scaling-grp-web"
}

variable "db_name" {
  description = "The name tag for the database instance"
  type        = string
  default     = "mydatabase"
}

variable "db_sg_name" {
  description = "The name tag for the database security group"
  type        = string
  default     = "multi-tier-db-sg"
}

variable "db_subnet_grp_name" {
  description = "The name tag for the database subnet group"
  type        = string
  default     = "multi-tier-db-subnet-grp"
}

variable "db_instance" {
  description = "The instance class for the database"
  type        = string
  default     = "db.t2.micro"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}