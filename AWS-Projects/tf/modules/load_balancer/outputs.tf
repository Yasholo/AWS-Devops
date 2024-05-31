output "load_balancer_dns_name" {
  description = "The DNS name of the created Application Load Balancer (ALB)"
  value       = aws_lb.web_lb.dns_name
}


output "web_tg_arn" {
  value = aws_lb_target_group.web_target_group.arn
}

output "app_tg_arn" {
  value = aws_lb_target_group.app_target_group.arn
}
