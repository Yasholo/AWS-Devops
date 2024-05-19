# Create ALB security group for application servers
resource "aws_security_group" "alb_app_sg" {
  name        = var.alb_sg_app_name
  description = "ALB Security Group for Application Servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow HTTP traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

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

# Create ASG security group for application servers
resource "aws_security_group" "asg_app_sg" {
  name        = var.asg_sg_app_name
  description = "ASG Security Group for Application Servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow HTTP traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_app_sg.id]
  }

  ingress {
    description = "Allow SSH traffic from anywhere or your IP"
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
    Name = var.asg_sg_app_name
  }
}

# Launch EC2 instances for application servers
resource "aws_instance" "app_servers" {
  count             = 2
  ami               = var.ami_id  # Specify your AMI
  instance_type     = var.instance_type
  subnet_id         = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
  security_group_ids = [aws_security_group.alb_app_sg.id]
  key_name          = var.key_name
  
  tags = {
    Name = var.app_instance_name
  }

  # Specify user data to configure application servers...
}

# Create Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = var.alb_app 
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
  security_groups    = [aws_security_group.alb_app_sg.id]
}

# Create Auto Scaling Group 
resource "aws_autoscaling_group" "asg_app" {
  name                = var.asg_sg_app_name 
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  target_group_arns   = [aws_lb_target_group.target-group-app.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]

  launch_template {
    id      = aws_launch_template.template-app.id
    version = aws_launch_template.template-app.latest_version
  }
}

# Create target group for application servers
resource "aws_lb_target_group" "app_target_group" {
  name     = var.app_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path     = "/"
    matcher  = 200
  }
}

# Attach application servers to target group
resource "aws_lb_target_group_attachment" "app_servers" {
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = aws_instance.app_servers.*.id
  port             = 80
}


# In this rewritten application/main.tf file:

#    The ALB security group and ASG security group for application servers are defined.
#    EC2 instances for application servers are launched across private subnets.
#    An Application Load Balancer (ALB) is created to distribute incoming application traffic.
#    An Auto Scaling Group (ASG) is set up to automatically scale the number of application server instances based on demand.
#    A target group for application servers is created and attached to the ALB.