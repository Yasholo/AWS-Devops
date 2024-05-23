variable "alb_sg_app_name" {
  description = "Name of the ALB security group for application servers"
  type        = string
}

variable "asg_sg_app_name" {
  description = "Name of the ASG security group for application servers"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the application servers"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the application servers"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access to the instances"
  type        = string
}

variable "app_instance_name" {
  description = "Name tag for the application server instances"
  type        = string
}

variable "alb_app" {
  description = "Name of the application load balancer"
  type        = string
}

variable "app_tg_name" {
  description = "Name of the target group for application servers"
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
    private_subnet_ids = list(string)
    aws_subnet = object({
      private_subnet_1 = object({
        id = string
      })
      private_subnet_2 = object({
        id = string
      })
    })
    aws_lb_target_group_app = object({
      arn = string
    })
    aws_launch_template_app = object({
      id = string
      latest_version = string
    })
  })
}
