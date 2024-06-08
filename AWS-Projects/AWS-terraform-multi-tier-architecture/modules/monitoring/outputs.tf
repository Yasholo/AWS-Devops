output "log_group_name" {
  description = "The name of the CloudWatch log group."
  value       = aws_cloudwatch_log_group.app_log_group.name
}

output "cpu_alarm_arn" {
  description = "The ARN of the CPU utilization alarm."
  value       = aws_cloudwatch_metric_alarm.cpu_utilization_high.arn
}


output "sns_topic_arn" {
  value = aws_sns_topic.alarm_topic.arn
}