output "web_server_ips" {
  value = module.presentation.web_server_ips
  description = "The IP addresses of the web servers launched."
}

output "database_endpoint" {
  value = module.database.endpoint
  description = "The endpoint of the RDS MySQL database."
}

output "web_lb_dns_name" {
  value = aws_lb.web_lb.dns_name
  description = "The DNS name of the Application Load Balancer for web servers."
}

output "app_lb_dns_name" {
  value = aws_lb.app_lb.dns_name
  description = "The DNS name of the Application Load Balancer for application servers."
}

output "cloudwatch_logs_app" {
  value = aws_cloudwatch_log_group.app_logs.arn
  description = "The ARN of the CloudWatch Log Group for application logs."
}

output "cloudwatch_logs_system" {
  value = aws_cloudwatch_log_group.system_logs.arn
  description = "The ARN of the CloudWatch Log Group for system logs."
}


# In this rewritten output.tf file:

#    The web_server_ips output provides the IP addresses of the web servers.
#    The database_endpoint output provides the endpoint of the RDS MySQL database.
#    The web_lb_dns_name output provides the DNS name of the Application Load Balancer for web servers.
#    The app_lb_dns_name output provides the DNS name of the Application Load Balancer for application servers.
#    The cloudwatch_logs_app output provides the ARN of the CloudWatch Log Group for application logs.
#    The cloudwatch_logs_system output provides the ARN of the CloudWatch Log Group for system logs.

# These outputs will be displayed after applying the Terraform configuration and can be useful for accessing and managing the deployed infrastructure. Adjust the descriptions as needed for clarity.