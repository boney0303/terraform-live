#######################################
########## Application vars ###########
#######################################
stack_name = "demo-app"
asg_desired_capacity = "1"
asg_max = "1"
asg_min = "1"
instance_type = "t2.micro"

db_port = "3388"
db_engine = "aurora-mysql"
db_engine_ver = "5.7.mysql_aurora.2.11.1"
rds_instance_class = "db.r5.large"
