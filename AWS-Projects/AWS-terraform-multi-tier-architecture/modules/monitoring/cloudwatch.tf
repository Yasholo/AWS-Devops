# Define AWS provider
provider "aws" {
  region = "us-east-1"
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

# CloudWatch Log Group for security logs
resource "aws_cloudwatch_log_group" "security
