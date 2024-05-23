# Create Application Load Balancer
resource "aws_lb" "web_lb" {
  name               = var.alb_web_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = [var.security_group_id]
}

# Create target group for web servers
resource "aws_lb_target_group" "web_target_group" {
  name     = var.web_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/"
    matcher  = 200
  }
}

# Attach web servers to target group
resource "aws_lb_target_group_attachment" "web_servers" {
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = var.target_instance_ids
  port             = 80
}
