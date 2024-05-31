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
  name     = var.web_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path     = "/"
    matcher  = 200
  }
}

# Create target group for application servers
resource "aws_lb_target_group" "app_target_group" {
  name     = var.app_tg_name
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
  for_each         = toset(var.web_instance_ids)
  target_group_arn = aws_lb_target_group.web_target_group.arn
  target_id        = each.value
  port             = 80
}

# Attach web servers to target group
resource "aws_lb_target_group_attachment" "app_servers" {
  for_each         = toset(var.app_instance_ids)
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = each.value
  port             = 80
}
