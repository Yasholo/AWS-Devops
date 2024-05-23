output "app_asg_name" {
  description = "Name of the application Auto Scaling Group"
  value       = aws_autoscaling_group.application.name
}

output "app_launch_template_id" {
  description = "ID of the application launch template"
  value       = aws_launch_template.application.id
}
