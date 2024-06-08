resource "aws_launch_configuration" "web" {
  name          = var.web_instance_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  associate_public_ip_address = true
 
  lifecycle {
    create_before_destroy = true
  }

  security_groups = [var.asg_sg_web_id]

  user_data = <<-EOF
              #!/bin/bash
              ${file("./deploy_web_app.sh")}
              EOF
}


resource "aws_autoscaling_group" "web" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = [var.public_subnet1_id, var.public_subnet2_id]
  launch_configuration = aws_launch_configuration.web.id

  tag {
    key                 = "Name"
    value               = var.web_instance_name
    propagate_at_launch = true
  }

  target_group_arns = [var.web_tg_arn]
}

resource "aws_launch_configuration" "app" {
  name          = var.app_instance_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  lifecycle {
    create_before_destroy = true
  }

  security_groups = [var.asg_sg_app_id]

  user_data = <<-EOF
              #!/bin/bash
              # Your bootstrap script here
              EOF
}


resource "aws_autoscaling_group" "app" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = [var.private_subnet1_id, var.private_subnet2_id]
  launch_configuration = aws_launch_configuration.app.id

  tag {
    key                 = "Name"
    value               = var.app_instance_name
    propagate_at_launch = true
  }

  target_group_arns = [var.app_tg_arn]
}