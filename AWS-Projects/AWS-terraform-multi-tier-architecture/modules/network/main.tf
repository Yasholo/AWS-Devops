provider "aws" {
  region = var.region
}

# Define the VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Define the Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}

# Define public subnets
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.az_1
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet1_name
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = var.az_2
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet2_name
  }
}

# Define private subnets
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.az_1
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_subnet1_name
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.az_2
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_subnet2_name
  }
}


resource "aws_subnet" "private_db_subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet1_cidr
  availability_zone = var.az_1
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_db_subnet1_name
  }
}

resource "aws_subnet" "private_db_subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_db_subnet2_cidr
  availability_zone = var.az_2
  map_public_ip_on_launch = false
  tags = {
    Name = var.private_db_subnet2_name
  }
}


# Define route tables and associations

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table" "private_route_table1" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table1.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table1.id
}



resource "aws_nat_gateway" "nat_gateway1" {
  allocation_id = aws_eip.nat_eip1.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "${var.nat_gw_name}-1"
  }

}

resource "aws_nat_gateway" "nat_gateway2" {
  allocation_id = aws_eip.nat_eip2.id
  subnet_id     = aws_subnet.public_subnet2.id

  tags = {
    Name = "${var.nat_gw_name}-2"
  }

}

resource "aws_eip" "nat_eip1" {
  domain = "vpc"
}

resource "aws_eip" "nat_eip2" {
  domain = "vpc"
}


#resource "aws_route_table" "private_route_table2" {
#  vpc_id = aws_vpc.main.id
#  tags = {
#    Name = "${var.private_rt_name}-2"
#  }
#}

#resource "aws_route" "private_route2" {
#  route_table_id         = aws_route_table.private_route_table2.id
#  destination_cidr_block = "0.0.0.0/0"
#  nat_gateway_id         = aws_nat_gateway.nat_gateway2.id
#}