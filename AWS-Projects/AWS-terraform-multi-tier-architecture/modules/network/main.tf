# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Create public subnet for Web Tier
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet1_name
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet2_name
  }
}

# Create private subnet for Application Tier
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet1_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet1_name
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet2_cidr
  availability_zone       = var.az_2
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet2_name
  }
}

# Create private subnet for Database Tier
resource "aws_subnet" "private_db_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet1_cidr
  availability_zone = var.az_1

  tags = {
    Name = var.private_db_subnet1_name
  }
}

resource "aws_subnet" "private_db_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet2_cidr
  availability_zone = var.az_2

  tags = {
    Name = var.private_db_subnet2_name
  }
}

# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

# Create NAT gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = var.nat_gw_name
  }

  depends_on = [aws_internet_gateway.gw]
}

# Attach internet gateway to VPC
resource "aws_vpc_attachment" "gw_attachment" {
  vpc_id             = aws_vpc.main.id
  internet_gateway_id = aws_internet_gateway.gw.id
}

# Create route table for public subnet
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id
}

# Associate public subnet with public route table
resource "aws_route_table_association" "public_rt_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "public_rt_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route.id
}

# Create route for internet gateway in public route table
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Outputs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "nat_gateway_ips" {
  value = [aws_nat_gateway.nat_gw.public_ip]
}

# Assuming you have these resources defined in your network module
output "aws_launch_template_web_id" {
  value = aws_launch_template.web.id
}

output "aws_launch_template_web_latest_version" {
  value = aws_launch_template.web.latest_version
}

output "aws_lb_target_group_web_arn" {
  value = aws_lb_target_group.web.arn
}



# In this rewritten network/main.tf file:

#    Resources related to the VPC, subnets, internet gateway, NAT gateway, route tables, and associations are grouped together.
#    Each resource is clearly defined with appropriate descriptions and tags.
#    Dependencies between resources are maintained properly.
#    The code is organized for better readability and maintainability.