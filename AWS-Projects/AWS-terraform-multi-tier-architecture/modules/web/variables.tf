variable "alb_sg_web_name" {
  description = "Name of the ALB security group for web servers"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the web servers"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the web servers"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access to the instances"
  type        = string
}

variable "web_instance_name" {
  description = "Name tag for the web server instances"
  type        = string
}

variable "asg_sg_web_name" {
  description = "Name of the ASG security group for web servers"
  type        = string
}

variable "alb_web" {
  description = "Name of the application load balancer"
  type        = string
}

variable "asg_web_name" {
  description = "Name of the auto scaling group for web servers"
  type        = string
}

variable "web_tg_name" {
  description = "Name of the target group for web servers"
  type        = string
}

variable "network_module_outputs" {
  description = "Outputs from the network module"
  type = object({
    aws_vpc = object({
      main = object({
        id = string
      })
    })
    public_subnet_ids = list(string)
    aws_lb_target_group_web = object({
      arn = string
    })
    aws_launch_template_web = object({
      id = string
      latest_version = string
    })
  })
}
