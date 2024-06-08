output "web_lb_arn" {
  description = "ARN of the web load balancer."
  value       = aws_lb.web.arn
}

output "app_lb_arn" {
  description = "ARN of the app load balancer."
  value       = aws_lb.app.arn
}

output "web_tg_arn" {
  description = "ARN of the web target group."
  value       = aws_lb_target_group.web.arn
}

output "app_tg_arn" {
  description = "ARN of the app target group."
  value       = aws_lb_target_group.app.arn
}

output "web_lb_dns_name" {
  value = aws_lb.web.dns_name
}

output "app_lb_dns_name" {
  value = aws_lb.app.dns_name
}