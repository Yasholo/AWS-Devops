output "app_asg_name" {
  description = "Name of the app ASG."
  value       = aws_autoscaling_group.app.name
}

output "web_asg_name" {
  description = "Name of the web ASG."
  value       = aws_autoscaling_group.web.name
}

output "web_instance_ids" {
  value = aws_autoscaling_group.web.id
}