variable "alb_web_name" {
  description = "The name tag for the web application load balancer"
  type        = string
  default     = "multi-tier-web-alb"
}

variable "subnets" {
  description = "A list of subnet IDs where the ALB will be placed"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "web_tg_name" {
  description = "The name for the target group associated with the ALB"
  type        = string
}

variable "app_tg_name" {
  description = "The name tag for the application target group"
  type        = string
}


variable "web_instance_ids" {
  description = "List of web instance IDs to attach to the target group"
  type        = list(string)
}

variable "app_instance_ids" {
  description = "List of app instance IDs to attach to the target group"
  type        = list(string)
}


variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

#variable "target_instance_ids" {
#  description = "A list of instance IDs to attach to the target group"
#  type        = list(string)
#}
