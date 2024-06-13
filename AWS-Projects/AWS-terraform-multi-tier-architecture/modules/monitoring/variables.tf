# Monitoring Variables

variable "log_group_name" {
  description = "The name of the CloudWatch log group."
  type        = string
}

variable "log_group_retention" {
  description = "The number of days to retain log events."
  type        = number
}

variable "cpu_alarm_name" {
  description = "The name of the CPU utilization alarm."
  type        = string
}

variable "cpu_alarm_threshold" {
  description = "The threshold for the CPU utilization alarm."
  type        = number
}

variable "instance_id" {
  description = "The ID of the instance to monitor."
  type        = string
}

variable "sns_topic_name" {
  description = "The name of the SNS topic for alarms"
  default     = "my-sns-topic"
}