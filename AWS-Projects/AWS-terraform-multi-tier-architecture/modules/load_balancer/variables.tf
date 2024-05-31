variable "security_group_id" {
  description = "Security group ID for the load balancers."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
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

variable "subnets" {
  description = "List of subnets for the load balancers."
  type        = list(string)
}
