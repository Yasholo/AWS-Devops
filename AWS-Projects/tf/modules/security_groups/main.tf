# Web Server Security Group
resource "aws_security_group" "web_sg" {
  name        = var.alb_sg_web_name
  description = "ALB Security Group for Web Servers"
  vpc_id      = module.network.aws_vpc.main.id

  # Define ingress rules for web servers
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define egress rules for web servers
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

# Auto Scaling Group Security Group for Web Servers
resource "aws_security_group" "asg_security_group_web" {
  name        = var.asg_sg_web_name
  description = "ASG Security Group for Web Servers"
  vpc_id      = module.network.aws_vpc.main.id

  # Ingress rule allowing HTTP traffic from ALB
  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  # Ingress rule allowing SSH traffic from anywhere or your IP
  ingress {
    description = "SSH From Anywhere or Your-IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule allowing all traffic
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

# Application Server Security Group
resource "aws_security_group" "alb_app_sg" {
  name        = var.alb_sg_app_name
  description = "ALB Security Group for Application Servers"
  vpc_id      = module.network.aws_vpc.main.id

  # Define ingress rules for application servers
  ingress {
    description     = "Allow HTTP traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  # Define egress rules for application servers
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb_sg_app_name
  }
}

# Application Server Auto Scaling Group Security Group
resource "aws_security_group" "asg_app_sg" {
  name        = var.asg_sg_app_name
  description = "ASG Security Group for Application Servers"
  vpc_id      = module.network.aws_vpc.main.id

  # Ingress rule allowing HTTP traffic from ALB
  ingress {
    description     = "Allow HTTP traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_app_sg.id]
  }

  # Ingress rule allowing SSH traffic from anywhere or your IP
  ingress {
    description = "Allow SSH traffic from anywhere or your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.asg_sg_app_name
  }
}

# Outputs if needed
