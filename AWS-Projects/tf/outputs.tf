output "vpc_id" {
  value = module.network.vpc_id
}

output "web_security_group_id" {
  value = module.security_group.web_security_group_id
}

output "app_security_group_id" {
  value = module.security_group.app_security_group_id
}

output "db_security_group_id" {
  value = module.security_group.db_sg_id
}
