variable "region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  default = "us-east-1"
  type        = string
}

variable "name" {
  description = "The name for the ec2 instance."
  default = "webapp-instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instnaces to run in the ASG (e.g. t2.micro)"
  default = "t2.micro"
  type        = string
}

variable "tf_role_arn" {
  description = "The instance profile arn (e.g. TF_InstanceProfile)"
  default = "arn:aws:iam::036476392584:role/TF_InstanceProfile"
  type = string
}

variable "env" {}
variable "stack_name" {}
variable "network_id" {}
variable "availability_zone" {}
variable "public_subnet" {
  type = map
}
variable "wait_for_elb_cap" {
  default = "1"
}
variable "wait_for_capacity_timeout" {}
variable "asg_desired_capacity" {}
variable "asg_max" {}
variable "asg_min" {}


variable "health_check_url" {
  default = "TCP:80"
}

######## LC variables #############
variable "webapp_sgs" {
  type = list(string)
  default = []
}
variable "iam_instance_profile" {}
variable "ssh_key" {}
variable "image_id" {
  default = ""
}


######## ELB Watchdog variables #############
variable "enable_elb_watchdog" {
  default = "false"
}


variable "max_retries" {}
variable "aws_account_id" {}

variable "owner" {
  default = ""
}
variable "security_tags" {
  type        = map
  description = "Security Mandatory Tags"
  default     = {}
}

variable "account_tags" {
  type        = map
  description = "Account specific tags"
  default     = {}
}

variable "ec2_instance_tags" {
  type        = map
  description = "Account specific tags"
  default     = {}
}

variable "alb_tg_arns" {
  type = list(string)
  default = []
}