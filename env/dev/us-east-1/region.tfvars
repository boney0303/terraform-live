#######################################
########## Region vars ################
#######################################

region     = "us-east-1"
dr_region  = "us-east-2"
env = "dev"
network_id = "1"
availability_zone = "us-east-1a"
vpc_id = {
  vpc_id_1 = "vpc-0148c36603a48a232"
  vpc_id_2 = "vpc-8885a2f2"
}

public_subnet = {
  public_subnet_1 = ["subnet-05978ee2148fccb88", "subnet-04897cc4dc961db80", "subnet-056d4969434055695"]
  public_subnet_2 = ["subnet-05978ee2148fccb88", "subnet-04897cc4dc961db80", "subnet-056d4969434055695"]
}

private_subnet = {
  private_subnet_1 = {
    us-east-1a = ["subnet-09d2136e1d55fbb9b"]
    us-east-1b = ["subnet-045ff6a50789bf2e9"]
    us-east-1c = ["subnet-02d44264cc7c94759"]
  }
  private_subnet_2 = {
    us-east-1a = ["subnet-094e31a2e19063d52"]
    us-east-1b = ["subnet-0bff699ae390da720"]
    us-east-1c = ["subnet-023aead1ba76d2fc0"]
  }
}


db_subnet_grp_name = {
  db_subnet_grp_name_1 = "demo-db-subnet-group"
}

azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
iam_instance_profile = "EC2-Prod-Instance-Profile"
tf_role_arn          = "arn:aws:iam::036476392584:role/TF_InstanceProfile"
ssh_key              = "us-east-1-2020-q1"
webapp_sgs           = ["sg-0ed94c2dfa02f6493", "sg-017107bedee7cece1"]
alb_sgs = {
  alb_sgs_1 = ["sg-0ed94c2dfa02f6493", "sg-040f21ccf433994cb"]
  alb_sgs_2 = ["sg-017107bedee7cece1"]
}
rds_sgs = {
  rds_sgs_1 = ["sg-06b0a9ed797159771", "sg-04e5f86861ed5e065"]
}

##########Monitoring vars##############
AdTopicAction       = "null"
AdAutoScalingTopic  = "null"


######### Instance Details ############
#image_id                  = "ami-0c2031ce636629a72"
enable_monitoring         = "false"
instance_type             = "t2.micro"
wait_for_capacity_timeout = "45m"
migrated_from_cf          = 0