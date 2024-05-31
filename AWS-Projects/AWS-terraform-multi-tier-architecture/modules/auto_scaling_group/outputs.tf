output "app_asg_name" {
  description = "Name of the app ASG."
  value       = aws_autoscaling_group.app.name
}

output "web_asg_name" {
  description = "Name of the web ASG."
  value       = aws_autoscaling_group.web.name
}
