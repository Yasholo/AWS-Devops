variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the Auto Scaling Group"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "asg_web_name" {
  description = "Name of the web Auto Scaling Group"
  type        = string
}

variable "asg_app_name" {
  description = "Name of the application Auto Scaling Group"
  type        = string
}

variable "web_instance_name" {
  description = "Name tag for the web instances"
  type        = string
}

variable "app_instance_name" {
  description = "Name tag for the application instances"
  type        = string
}

variable "asg_sg_web_id" {
  description = "Security Group ID for web Auto Scaling Group"
  type        = string
}

variable "asg_sg_app_id" {
  description = "Security Group ID for application Auto Scaling Group"
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

variable "private_subnet1_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "private_subnet2_id" {
  description = "ID of the second private subnet"
  type        = string
}

variable "web_tg_arn" {
  description = "ARN of the web target group"
  type        = string
}

variable "app_tg_arn" {
  description = "ARN of the application target group"
  type        = string
}
