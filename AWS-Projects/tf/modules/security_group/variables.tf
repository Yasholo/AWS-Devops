variable "alb_sg_web_name" {
  description = "Name for the ALB Security Group for Web Servers"
  type        = string
}

variable "asg_sg_web_name" {
  description = "Name for the ASG Security Group for Web Servers"
  type        = string
}

variable "alb_sg_app_name" {
  description = "Name for the ALB Security Group for Application Servers"
  type        = string
}

variable "asg_sg_app_name" {
  description = "Name for the ASG Security Group for Application Servers"
  type        = string
}

variable "db_sg_name" {
  description = "Name for the Database Security Group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}