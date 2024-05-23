# Create security group for web servers
resource "aws_security_group" "web_sg" {
  name        = var.alb_sg_web_name
  description = "ALB Security Group for Web Servers"
  vpc_id      = module.network.aws_vpc.main.id

  # Define ingress and egress rules...
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb_sg_web_name
  }
}

# Launch EC2 instances for web servers
resource "aws_instance" "web_servers" {
  count                = 2
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = [module.network.public_subnet_ids[0], module.network.public_subnet_ids[1]]
  security_group_ids   = [aws_security_group.web_sg.id]

  user_data = filebase64("user_data.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.web_instance_name
    }
  }

  # Specify user data to configure web servers...
}

# Create Auto Scaling Security Group 
resource "aws_security_group" "asg_security_group_web" {
  name        = var.asg_sg_web_name
  description = "ASG Security Group for Web Servers"
  vpc_id      = module.network.aws_vpc.main.id

  ingress {
    description = "HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  ingress {
    description = "SSH From Anywhere or Your-IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.asg_sg_web_name
  }
}

# Create Application Load Balancer
resource "aws_lb" "web_lb" {
  name               = var.alb_web
  internal           = false
  load_balancer_type = "application"
  subnets            = module.network.public_subnet_ids
  security_groups    = [aws_security_group.web_sg.id]
}

output "dns_name" {
  value = aws_lb.web_lb.dns_name
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "asg_web" {
  name                = var.asg_web_name
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  target_group_arns   = [module.network.aws_lb_target_group_web.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = module.network.public_subnet_ids

  launch_template {
    id      = module.network.aws_launch_template_web.id
    version = module.network.aws_launch_template_web.latest_version
  }
}

# Create target group for web servers
resource "aws_lb_target_group" "web_target_group" {
  name     = var.web_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.aws_vpc.main.id

  health_check {
    path     = "/"
    matcher  = 200
  }
}

# Attach web servers to target group
resource "aws_lb_target_group_attachment" "web_servers" {
  type             = "forward"
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = aws_instance.web_servers.*.id
  port             = 80
}



# In this rewritten web/main.tf file:
#
#    The security group, EC2 instance, ALB, ASG security group, ASG, target group, and their attachments are grouped together.
#    Each resource is clearly defined with appropriate descriptions and tags.
#    Dependencies between resources are maintained properly.
#    The code is organized for better readability and maintainability.