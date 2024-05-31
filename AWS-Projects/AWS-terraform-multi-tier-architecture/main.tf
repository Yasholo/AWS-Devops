provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"
  vpc_cidr = var.vpc_cidr
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
  az1 = var.az1
  az2 = var.az2
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
  subnets = [module.network.public_subnet1_id, module.network.public_subnet2_id]
  security_group_id = module.security_group.alb_sg_web_id
  web_lb_name = var.web_lb_name
  app_lb_name = var.app_lb_name
  web_tg_name = var.web_tg_name
  app_tg_name = var.app_tg_name
}

module "auto_scaling_group" {
  source = "./modules/auto_scaling_group"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  asg_sg_web_id = module.security_group.asg_sg_web_id
  asg_sg_app_id = module.security_group.asg_sg_app_id
  public_subnet_ids = [module.network.public_subnet1_id, module.network.public_subnet2_id]
  private_subnet_ids = [module.network.private_subnet1_id, module.network.private_subnet2_id]
  web_tg_arn = module.load_balancer.web_tg_arn
  app_tg_arn = module.load_balancer.app_tg_arn
  web_instance_name = var.web_instance_name
  app_instance_name = var.app_instance_name
  asg_web_name = var.asg_web_name
  asg_app_name = var.asg_app_name
}

module "database" {
  source = "./modules/database"
  db_subnet_group_name = var.db_subnet_group_name
  db_subnet_ids = [module.network.private_db_subnet1_id, module.network.private_db_subnet2_id]
  db_instance_name = var.db_instance_name
  db_engine = var.db_engine
  db_instance_class = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_name = var.db_name
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
  alarm_action = var.alarm_action
  ok_action = var.ok_action
  instance_id = module.auto_scaling_group.web_instance_id
}
