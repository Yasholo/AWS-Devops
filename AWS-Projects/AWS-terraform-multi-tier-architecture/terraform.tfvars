region = "us-east-1"

# Network Variables
vpc_cidr_block = "10.0.0.0/16"
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
public_rt_name = "public-route-table"
private_rt_name = "private-route-table"
nat_gw_name = "three-tier-nat-gw"
az_1 = "us-east-1a"
az_2 = "us-east-1b"

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
ami_id = "ami-04b70fa74e45c3917"            #Change this to your ami_id
instance_type = "t2.micro"
key_name = "Jobs"                           #Give the name of your private key. (Make sure you have the privat key .pem file in the directory, and refering to it while creating ec2 instance)
web_instance_name = "web-instance"
app_instance_name = "app-instance"

# Database Variables
db_subnet_group_name = "db-subnet-group"
db_instance_name = "my-database"
db_engine = "mysql"
db_instance_class = "db.t3.micro"
db_allocated_storage = 20
db_username = "dbadmin"    
db_password = "010password69-="

# Monitoring Variables
log_group_name = "app-log-group"
log_group_retention = 7
cpu_alarm_name = "high-cpu-utilization"
cpu_alarm_threshold = 80
sns_topic_name = "my-east-sns-topic"