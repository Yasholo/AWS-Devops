output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = [module.network.public_subnet1_id, module.network.public_subnet2_id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = [module.network.private_subnet1_id, module.network.private_subnet2_id]
}

output "web_lb_dns_name" {
  description = "The DNS name of the web load balancer."
  value       = module.load_balancer.web_lb_dns_name
}

output "app_lb_dns_name" {
  description = "The DNS name of the app load balancer."
  value       = module.load_balancer.app_lb_dns_name
}

output "web_asg_name" {
  description = "The name of the web auto-scaling group."
  value       = module.auto_scaling_group.web_asg_name
}

output "app_asg_name" {
  description = "The name of the app auto-scaling group."
  value       = module.auto_scaling_group.app_asg_name
}

output "db_instance_id" {
  description = "The ID of the database instance."
  value       = module.database.db_instance_id
}

output "db_instance_endpoint" {
  description = "The endpoint of the database instance."
  value       = module.database.db_instance_endpoint
}

output "log_group_name" {
  description = "The name of the CloudWatch log group."
  value       = module.monitoring.log_group_name
}

output "cpu_alarm_arn" {
  description = "The ARN of the CPU utilization alarm."
  value       = module.monitoring.cpu_alarm_arn
}
