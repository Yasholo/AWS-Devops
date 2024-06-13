provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
  region = var.region
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name = var.vpc_name
  igw_name = var.igw_name
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
  nat_gw_name = var.nat_gw_name
  az_1 = var.az_1
  az_2 = var.az_2
  public_rt_name = var.public_rt_name
  private_rt_name = var.private_rt_name
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.network.vpc_id
  alb_sg_web_name = var.alb_sg_web_name
  alb_sg_app_name = var.alb_sg_app_name
  asg_sg_web_name = var.asg_sg_web_name
  asg_sg_app_name = var.asg_sg_app_name
  db_sg_name = var.db_sg_name
}

module "load_balancer" {
  source = "./modules/load_balancer"
  vpc_id = module.network.vpc_id
  pub_subnets            = [module.network.public_subnet1_id, module.network.public_subnet2_id]
  pri_subnets            = [module.network.private_subnet1_id, module.network.private_subnet2_id]
  security_group_web     = [module.security_group.asg_web_security_group_id]
  security_group_app     = [module.security_group.asg_app_security_group_id]
  web_lb_name = var.web_lb_name
  app_lb_name = var.app_lb_name
  web_tg_name = var.web_tg_name
  app_tg_name = var.app_tg_name
}

module "auto_scaling_group" {
  source = "./modules/auto_scaling_group"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  asg_sg_web_id         = module.security_group.asg_web_security_group_id
  asg_sg_app_id         = module.security_group.asg_app_security_group_id
  public_subnet1_id     = module.network.public_subnet1_id
  public_subnet2_id     = module.network.public_subnet2_id
  private_subnet1_id    = module.network.private_subnet1_id
  private_subnet2_id    = module.network.private_subnet2_id
  web_tg_arn            = module.load_balancer.web_tg_arn
  app_tg_arn            = module.load_balancer.app_tg_arn
  web_instance_name     = var.web_instance_name
  app_instance_name     = var.app_instance_name
}

module "database" {
  source = "./modules/database"
  db_subnet_group_name = var.db_subnet_group_name
  db_subnet_ids = [module.network.private_db_subnet1_id, module.network.private_db_subnet2_id]
  db_instance_name = var.db_instance_name
  db_engine = var.db_engine
  db_instance_class = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_username = var.db_username
  db_password = var.db_password
  db_security_group_id = module.security_group.db_sg_id
}

module "monitoring" {
  source = "./modules/monitoring"
  log_group_name = var.log_group_name
  log_group_retention = var.log_group_retention
  cpu_alarm_name = var.cpu_alarm_name
  cpu_alarm_threshold = var.cpu_alarm_threshold
  instance_id = module.auto_scaling_group.web_instance_ids
  sns_topic_name = var.sns_topic_name
}