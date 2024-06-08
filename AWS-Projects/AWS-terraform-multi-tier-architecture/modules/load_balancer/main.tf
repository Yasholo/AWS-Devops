resource "aws_lb" "web" {
  name               = var.web_lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_web
  subnets            = var.pub_subnets

  tags = {
    Name = var.web_lb_name
  }
}

resource "aws_lb" "app" {
  name               = var.app_lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_app
  subnets            = var.pri_subnets

  tags = {
    Name = var.app_lb_name
  }
}

resource "aws_lb_target_group" "web" {
  name     = var.web_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = var.web_tg_name
  }
}

resource "aws_lb_listener" "alb_listener_web" {
  load_balancer_arn = aws_lb.web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb_target_group" "app" {
  name     = var.app_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {# Load Balancer Variables
web_lb_name = "web-lb"
app_lb_name = "app-lb"
web_tg_name = "web-tg"
app_tg_name = "app-tg"
    Name = var.app_tg_name
  }
}

resource "aws_lb_listener" "alb_listener_app" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}