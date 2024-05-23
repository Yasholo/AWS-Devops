variable "alb_web_name" {
  description = "The name for the Application Load Balancer (ALB)"
  type        = string
}

variable "subnets" {
  description = "A list of subnet IDs where the ALB will be placed"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the ALB will be created"
  type        = string
}

variable "web_target_group_name" {
  description = "The name for the target group associated with the ALB"
  type        = string
}

variable "target_instance_ids" {
  description = "A list of instance IDs to attach to the target group"
  type        = list(string)
}
