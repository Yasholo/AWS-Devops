output "web_security_group_id" {
  description = "The ID of the Web Server Security Group"
  value       = aws_security_group.web_sg.id
}

output "asg_web_security_group_id" {
  description = "The ID of the Auto Scaling Group Security Group for Web Servers"
  value       = aws_security_group.asg_security_group_web.id
}

output "app_security_group_id" {
  description = "The ID of the Application Server Security Group"
  value       = aws_security_group.alb_app_sg.id
}

output "asg_app_security_group_id" {
  description = "The ID of the Auto Scaling Group Security Group for Application Servers"
  value       = aws_security_group.asg_app_sg.id
}
