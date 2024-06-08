# Security Group Variables

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "alb_sg_web_name" {
  description = "Name of the security group for the web load balancer."
  type        = string
}

variable "asg_sg_web_name" {
  description = "Name of the security group for the web auto-scaling group."
  type        = string
}

variable "alb_sg_app_name" {
  description = "Name of the security group for the app load balancer."
  type        = string
}

variable "asg_sg_app_name" {
  description = "Name of the security group for the app auto-scaling group."
  type        = string
}

variable "db_sg_name" {
  description = "Name of the security group for the database."
  type        = string
}