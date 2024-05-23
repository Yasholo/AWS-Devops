output "web_asg_id" {
  description = "ID of the web Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.id
}

output "app_asg_id" {
  description = "ID of the application Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.id
}
