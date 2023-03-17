variable "region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  default = "us-east-1"
  type        = string
}

variable "name" {
  description = "The name for the ec2 instance."
  default = "webapp-alb"
  type        = string
}

variable "tf_role_arn" {}

variable "env" {}
variable "stack_name" {}
variable "network_id" {}

variable "vpc_id"{
  type = map
}
variable "public_subnet" {
  type = map
}

variable "alb_sgs" {
  type = map
}

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

variable "max_retries" {}
