provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"
  region_name         = var.region_name
  vpc_cidr_block      = var.vpc_cidr_block
  vpc_name            = var.vpc_name
  igw_name            = var.igw_name
  nat_gw_name         = var.nat_gw_name
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet1_name = var.public_subnet1_name
  public_subnet2_cidr = var.public_subnet2_cidr
  public_subnet2_name = var.public_subnet2_name
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet1_name = var.private_subnet1_name
  private_subnet2_cidr = var.private_subnet2_cidr
  private_subnet2_name = var.private_subnet2_name
  private_db_subnet1_cidr = var.private_db_subnet1_cidr
  private_db_subnet1_name = var.private_db_subnet1_name
  private_db_subnet2_cidr = var.private_db_subnet2_cidr
  private_db_subnet2_name = var.private_db_subnet2_name
  az_1                = var.az_1
  az_2                = var.az_2
  public_rt_name      = var.public_rt_name
  private_rt_name     = var.private_rt_name
}

module "security_group" {
  source            = "./modules/security_group"
  vpc_id            = module.network.vpc_id
  web_sg_cidr_blocks = var.web_sg_cidr_blocks
  app_sg_cidr_blocks = var.app_sg_cidr_blocks
  db_sg_cidr_blocks  = var.db_sg_cidr_blocks
}


data "aws_instances" "web_instances" {
  filter {
    name   = "tag:Name"
    values = [var.web_instance_name]
  }
}

data "aws_instances" "app_instances" {
  filter {
    name   = "tag:Name"
    values = [var.app_instance_name]
  }
}

module "load_balancer" {
  source             = "./modules/load_balancer"
  vpc_id             = module.network.vpc_id
  subnets            = module.network.public_subnets
  web_tg_name        = var.web_tg_name
  app_tg_name        = var.app_tg_name
  web_instance_ids   = data.aws_instances.web_instances.ids
  app_instance_ids   = data.aws_instances.app_instances.ids
  web_security_group = module.security_group.alb_web_sg_id
}

module "auto_scaling_group" {
  source = "./modules/auto_scaling_group"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  asg_web_name       = var.asg_web_name
  asg_app_name       = var.asg_app_name
  web_instance_name  = var.web_instance_name
  app_instance_name  = var.app_instance_name
  asg_sg_web_id      = module.security_group.asg_web_security_group_id
  asg_sg_app_id      = module.security_group.asg_app_security_group_id
  public_subnet1_id  = module.network.public_subnet1_id
  public_subnet2_id  = module.network.public_subnet2_id
  private_subnet1_id = module.network.private_subnet1_id
  private_subnet2_id = module.network.private_subnet2_id
  web_tg_arn         = module.load_balancer.web_tg_arn
  app_tg_arn         = module.load_balancer.app_tg_arn
  # user_data_script    = file("deploy_app.sh")
}

module "database" {
  source = "./modules/database"
  db_name               = var.db_name
  db_instance_class     = var.db_instance_class
  db_username           = var.db_username
  db_password           = var.db_password
  db_subnet_grp_name    = var.db_subnet_grp_name
  private_db_subnet1_id = module.network.private_db_subnet1_id
  private_db_subnet2_id = module.network.private_db_subnet2_id
  db_sg_id              = module.security_group.db_sg_id
}

module "web" {
  source = "./modules/web"
  web_instance_name = var.web_instance_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  asg_sg_web_id     = module.security_group.asg_sg_web_id
  public_subnet1_id = module.network.public_subnet1_id
  public_subnet2_id = module.network.public_subnet2_id
  web_tg_arn        = module.load_balancer.web_tg_arn
}

module "application" {
  source = "./modules/application"
  app_instance_name = var.app_instance_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  asg_sg_app_id     = module.security_group.asg_sg_app_id
  private_subnet1_id = module.network.private_subnet1_id
  private_subnet2_id = module.network.private_subnet2_id
  app_tg_arn        = module.load_balancer.app_tg_arn
}


module "monitoring" {
  source = "./modules/monitoring"
  app_instance_id = aws_instance.app.id
  web_instance_id = aws_instance.web.id
  db_instance_id = aws_db_instance.db.id
}
