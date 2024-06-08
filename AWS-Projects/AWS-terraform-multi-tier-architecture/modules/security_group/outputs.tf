output "web_security_group_id" {
  description = "ID of the web security group."
  value       = aws_security_group.web_sg.id
}

output "app_security_group_id" {
  description = "ID of the app security group."
  value       = aws_security_group.app_sg.id
}

output "asg_web_security_group_id" {
  description = "ID of the web ASG security group."
  value       = aws_security_group.asg_web_sg.id
}

output "asg_app_security_group_id" {
  description = "ID of the app ASG security group."
  value       = aws_security_group.asg_app_sg.id
}

output "db_sg_id" {
  description = "ID of the database security group."
  value       = aws_security_group.db_sg.id
}