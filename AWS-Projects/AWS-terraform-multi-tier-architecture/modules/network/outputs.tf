output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet1_id" {
  description = "The ID of the first public subnet."
  value       = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  description = "The ID of the second public subnet."
  value       = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
  description = "The ID of the first private subnet."
  value       = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  description = "The ID of the second private subnet."
  value       = aws_subnet.private_subnet2.id
}

output "private_db_subnet1_id" {
  description = "The ID of the first private database subnet."
  value       = aws_subnet.private_db_subnet1.id
}

output "private_db_subnet2_id" {
  description = "The ID of the second private database subnet."
  value       = aws_subnet.private_db_subnet2.id
}