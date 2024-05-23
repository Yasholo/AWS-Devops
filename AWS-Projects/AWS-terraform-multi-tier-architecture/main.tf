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
  source               = "./modules/web"
  region_name          = var.region_name
  alb_sg_web_name      = var.alb_sg_web_name
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  web_instance_name    = var.web_instance_name
  asg_sg_web_name      = var.asg_sg_web_name
  alb_web              = var.alb_web
  asg_web_name         = var.asg_web_name
  web_tg_name          = var.web_tg_name
  # Define other input variables as needed
}


# Application Layer: Launch application servers

module "application" {
  source              = "./modules/application"
  region_name         = var.region_name
  asg_sg_app_name     = var.asg_sg_app_name
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  app_instance_name   = var.app_instance_name
  alb_app             = var.alb_app
  asg_app_name        = var.asg_app_name
  app_tg_name         = var.app_tg_name

  network_module_outputs = {
    vpc_id             = module.network.vpc_id
    public_subnet_ids  = module.network.public_subnet_ids
    private_subnet_ids = module.network.private_subnet_ids
  }
  
  # Define other input variables as needed
}


# Data Layer: Launch RDS MySQL database

module "database" {
  source              = "./modules/database"
  region_name         = var.region_name
  db_instance         = var.db_instance
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  db_sg_name          = var.db_sg_name
  db_subnet_grp_name  = var.db_subnet_grp_name
  # Define other input variables as needed
}


# Monitoring and Logging

module "monitoring" {
  source      = "./modules/monitoring"
  region_name = var.region_name
  # Define other input variables as needed
}
