# Launch Configuration for Web Servers
resource "aws_launch_configuration" "web_launch_config" {
  name          = "${var.asg_web_name}-launch-configuration"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [var.asg_sg_web_id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = file("${path.module}/web_user_data.sh")  # Provide the path to your user data script
}

# Auto Scaling Group for Web Servers
resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_launch_config.id
  vpc_zone_identifier  = [var.public_subnet1_id, var.public_subnet2_id]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  target_group_arns    = [var.web_tg_arn]

  tag {
    key                 = "Name"
    value               = var.web_instance_name
    propagate_at_launch = true
  }
}

# Launch Configuration for Application Servers
resource "aws_launch_configuration" "app_launch_config" {
  name          = "${var.asg_app_name}-launch-configuration"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [var.asg_sg_app_id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = file("${path.module}/app_user_data.sh")  # Provide the path to your user data script
}

# Auto Scaling Group for Application Servers
resource "aws_autoscaling_group" "app_asg" {
  launch_configuration = aws_launch_configuration.app_launch_config.id
  vpc_zone_identifier  = [var.private_subnet1_id, var.private_subnet2_id]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  target_group_arns    = [var.app_tg_arn]

  tag {
    key                 = "Name"
    value               = var.app_instance_name
    propagate_at_launch = true
  }
}
