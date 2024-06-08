output "db_instance_id" {
  description = "The ID of the database instance."
  value       = aws_db_instance.db_instance.id
}

output "db_instance_endpoint" {
  description = "The endpoint of the database instance."
  value       = aws_db_instance.db_instance.endpoint
}