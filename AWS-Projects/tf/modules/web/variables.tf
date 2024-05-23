variable "web_instance_name" {
  description = "Name of the web instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the web instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the web instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for the web instance"
  type        = string
}

variable "asg_sg_web_id" {
  description = "Security group ID for the web ASG"
  type        = string
}

variable "public_subnet1_id" {
  description = "ID of the first public subnet"
  type        = string
}

variable "public_subnet2_id" {
  description = "ID of the second public subnet"
  type        = string
}

variable "web_tg_arn" {
  description = "ARN of the web target group"
  type        = string
}
