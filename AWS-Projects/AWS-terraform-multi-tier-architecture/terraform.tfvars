region = "us-west-2"

# Network Variables
vpc_cidr = "10.0.0.0/16"
vpc_name = "my-vpc"
igw_name = "my-igw"
public_subnet1_cidr = "10.0.1.0/24"
public_subnet1_name = "public-subnet-1"
public_subnet2_cidr = "10.0.2.0/24"
public_subnet2_name = "public-subnet-2"
private_subnet1_cidr = "10.0.3.0/24"
private_subnet1_name = "private-subnet-1"
private_subnet2_cidr = "10.0.4.0/24"
private_subnet2_name = "private-subnet-2"
private_db_subnet1_cidr = "10.0.5.0/24"
private_db_subnet1_name = "private-db-subnet-1"
private_db_subnet2_cidr = "10.0.6.0/24"
private_db_subnet2_name = "private-db-subnet-2"
az1 = "us-west-2a"
az2 = "us-west-2b"
public_rt_name = "public-route-table"
private_rt_name = "private-route-table"

# Security Group Variables
alb_sg_web_name = "alb-sg-web"
alb_sg_app_name = "alb-sg-app"
asg_sg_web_name = "asg-sg-web"
asg_sg_app_name = "asg-sg-app"
db_sg_name = "db-sg"

# Load Balancer Variables
web_lb_name = "web-lb"
app_lb_name = "app-lb"
web_tg_name = "web-tg"
app_tg_name = "app-tg"

# Auto Scaling Group Variables
ami_id = "ami-0abcdef1234567890"
instance_type = "t2.micro"
key_name = "Jobs"
web_instance_name = "web-instance"
app_instance_name = "app-instance"
asg_web_name = "web-asg"
asg_app_name = "app-asg"

# Database Variables
db_subnet_group_name = "db-subnet-group"
db_instance_name = "my-database"
db_engine = "mysql"
db_instance_class = "db.t3.micro"
db_allocated_storage = 20
db_name = "mydb"
db_username = "admin"
db_password = "mypassword"

# Monitoring Variables
log_group_name = "app-log-group"
log_group_retention = 7
cpu_alarm_name = "high-cpu-utilization"
cpu_alarm_threshold = 80
alarm_action = "arn:aws:sns:us-west-2:123456789012:my-sns-topic"
ok_action = "arn:aws:sns:us-west-2:123456789012:my-sns-topic"
