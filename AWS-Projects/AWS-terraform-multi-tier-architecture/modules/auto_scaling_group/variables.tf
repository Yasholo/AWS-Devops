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

# variable "asg_web_name" {
#   description = "The name of the web auto-scaling group."
#   type        = string
# }

# variable "asg_app_name" {
#   description = "The name of the app auto-scaling group."
#   type        = string
# }

variable "asg_sg_web_id" {
  description = "Security group ID for the web ASG."
  type        = string
}

variable "asg_sg_app_id" {
  description = "Security group ID for the app ASG."
  type        = string
}

variable "private_subnet1_id" {
  description = "ID of the first private subnet."
  type        = string
}

variable "private_subnet2_id" {
  description = "ID of the second private subnet."
  type        = string
}

variable "public_subnet1_id" {
  description = "ID of the first public subnet."
  type        = string
}

variable "public_subnet2_id" {
  description = "ID of the second public subnet."
  type        = string
}

variable "app_tg_arn" {
  description = "ARN of the app target group."
  type        = string
}

variable "web_tg_arn" {
  description = "ARN of the web target group."
  type        = string
}