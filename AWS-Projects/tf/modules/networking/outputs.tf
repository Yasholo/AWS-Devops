output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table1_id" {
  value = aws_route_table.private_route_table1.id
}

output "private_route_table2_id" {
  value = aws_route_table.private_route_table2.id
}

output "nat_gateway1_id" {
  value = aws_nat_gateway.nat_gateway1.id
}

output "nat_gateway2_id" {
  value = aws_nat_gateway.nat_gateway2.id
}

output "nat_eip1_public_ip" {
  value = aws_eip.nat_eip1.public_ip
}

output "nat_eip2_public_ip" {
  value = aws_eip.nat_eip2.public_ip
}
