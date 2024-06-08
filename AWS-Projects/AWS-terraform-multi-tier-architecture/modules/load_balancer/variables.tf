variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

# Load Balancer Variables

variable "security_group_web" {
  description = "Web security group ID for the load balancers."
  type        = list(string)
}

variable "security_group_app" {
  description = "App security group ID for the load balancers."
  type        = list(string)
}

variable "pub_subnets" {
  description = "A list of public subnet IDs where the ALB will be placed"
  type        = list(string)
}

variable "pri_subnets" {
  description = "A list of private subnet IDs where the ALB will be placed"
  type        = list(string)
}

variable "web_lb_name" {
  description = "Name of the web load balancer."
  type        = string
}

variable "app_lb_name" {
  description = "Name of the app load balancer."
  type        = string
}

variable "web_tg_name" {
  description = "Name of the target group for the web instances."
  type        = string
}

variable "app_tg_name" {
  description = "Name of the target group for the application instances."
  type        = string
}