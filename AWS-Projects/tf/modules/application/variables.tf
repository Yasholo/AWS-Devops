variable "app_instance_name" {
  description = "Name of the application instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the application instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the application instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for the application instance"
  type        = string
}

variable "asg_sg_app_id" {
  description = "Security group ID for the application ASG"
  type        = string
}

variable "private_subnet1_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "private_subnet2_id" {
  description = "ID of the second private subnet"
  type        = string
}

variable "app_tg_arn" {
  description = "ARN of the application target group"
  type        = string
}
