variable "region" {}
variable "dr_region" {}
variable "network_id" {}
variable "env" {}
variable "stack_name" {}
variable "availability_zone" {}
variable "tf_role_arn" {}
variable "private_subnet" {
  type = map
}
variable "rds_sgs" {
  type = map
}
variable "apply_immidiate" {
  default = true
}
variable "db_port" {}
variable "db_instance_count" {
  default = "1"
}
variable "db_subnet_grp_name" {
  type = map
}
variable "azs" {
  type = list(string)
}
variable "publically_accessible" {}
variable "rds_instance_class" {
  default = "db.r5.large"
}
variable "db_engine_ver" {}
variable "db_engine" {}
variable "auto_minor_version_upgrade" {
  default = "false"
}
variable "backup_retention_period" {}

variable "rds_master_username" {
  default = "admin"
}
variable "rds_master_password" {
  default = "admin123"
}
variable "set_az" {
  default = "false"
}
variable "max_retries" {}

variable "owner" {
  default = ""
}

variable "deletion_protection" {
  default = "false"
}
variable "enable_performance_insights" {
  default = "false"
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
