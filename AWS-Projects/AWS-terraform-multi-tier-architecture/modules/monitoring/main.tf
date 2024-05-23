# Define AWS provider
provider "aws" {
  region = var.region_name
}

# CloudWatch Log Group for application logs
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/app_logs"
  retention_in_days = 30
}

# CloudWatch Log Group for system logs
resource "aws_cloudwatch_log_group" "system_logs" {
  name              = "/system_logs"
  retention_in_days = 30
}

output "app_logs_arn" {
  value = aws_cloudwatch_log_group.app_logs.arn
}

output "system_logs_arn" {
  value = aws_cloudwatch_log_group.system_logs.arn
}