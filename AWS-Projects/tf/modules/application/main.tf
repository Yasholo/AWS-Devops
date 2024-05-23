# Auto Scaling Group for Application Servers
resource "aws_launch_template" "application" {
  name_prefix   = var.app_instance_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.asg_sg_app_id]
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.app_instance_name
    }
  }
}

resource "aws_autoscaling_group" "application" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 1
  launch_template {
    id      = aws_launch_template.application.id
    version = "$Latest"
  }

  vpc_zone_identifier = [var.private_subnet1_id, var.private_subnet2_id]
  target_group_arns   = [var.app_tg_arn]
  health_check_type   = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = var.app_instance_name
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
