output "load_balancer_dns_name" {
  description = "The DNS name of the created Application Load Balancer (ALB)"
  value       = aws_lb.web_lb.dns_name
}
