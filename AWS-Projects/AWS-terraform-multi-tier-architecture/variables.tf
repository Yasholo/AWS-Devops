variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

# Network Variables
variable "vpc_cidr" {
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

variable "az1" {
  description = "The first availability zone."
  type        = string
}

variable "az2" {
  description = "The second availability zone."
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

# Security Group Variables
variable "alb_sg_web_name" {
  description = "The name of the security group for the web load balancer."
  type        = string
}

variable "alb_sg_app_name" {
  description = "The name of the security group for the app load balancer."
  type        = string
}

variable "asg_sg_web_name" {
  description = "The name of the security group for the web auto-scaling group."
  type        = string
}

variable "asg_sg_app_name" {
  description = "The name of the security group for the app auto-scaling group."
  type        = string
}

variable "db_sg_name" {
  description = "The name of the security group for the database."
  type        = string
}

# Load Balancer Variables
variable "web_lb_name" {
  description = "The name of the web load balancer."
  type        = string
}

variable "app_lb_name" {
  description = "The name of the app load balancer."
  type        = string
}

variable "web_tg_name" {
  description = "The name of the web target group."
  type        = string
}

variable "app_tg_name" {
  description = "The name of the app target group."
  type        = string
}

# Auto Scaling Group Variables
variable "ami_id" {
  description = "The AMI ID for the instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the instances."
  type        = string
}

variable "key_name" {
  description = "The key name for SSH access."
  type        = string
}

variable "web_instance_name" {
  description = "The name of the web instances."
  type        = string
}

variable "app_instance_name" {
  description = "The name of the app instances."
  type        = string
}

variable "asg_web_name" {
  description = "The name of the web auto-scaling group."
  type        = string
}

variable "asg_app_name" {
  description = "The name of the app auto-scaling group."
  type        = string
}

# Database Variables
variable "db_subnet_group_name" {
  description = "The name of the database subnet group."
  type        = string
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

# Monitoring Variables
variable "log_group_name" {
  description = "The name of the CloudWatch log group."
  type        = string
}

variable "log_group_retention" {
  description = "The number of days to retain log events."
  type        = number
}

variable "cpu_alarm_name" {
  description = "The name of the CPU utilization alarm."
  type        = string
}

variable "cpu_alarm_threshold" {
  description = "The threshold for the CPU utilization alarm."
  type        = number
}

variable "alarm_action" {
  description = "The action to take when the alarm is triggered."
  type        = string
}

variable "ok_action" {
  description = "The action to take when the alarm is OK."
  type        = string
}
