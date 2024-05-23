# Configure AWS provider
provider "aws" {
  region = var.region_name
}

# Include modules


# Create VPC, subnets, internet gateway, route tables, etc.

module "network" {
  source = "./modules/network"
}


# Presentation Layer: Launch web servers and load balancer


module "web" {
  source      = "./modules/web"
  subnet_ids = module.network.public_subnet_ids
}


# Application Layer: Launch application servers

module "application" {
  source      = "./modules/application"
  subnet_ids = module.network.private_subnet_ids
}


# Data Layer: Launch RDS MySQL database

module "database" {
  source = "./modules/database"
}


# Monitoring and Logging

module "monitoring" {
  source = "./modules/monitoring"
}
