module "rds" {
  #source = "../../../../env/terrafiles/tf-modules/rds"
  source = "../../../../../terraform-modules/rds"

  db_subnet_grp_name = "${var.db_subnet_grp_name["db_subnet_grp_name_${var.network_id}"]}"
  final_snap_id = "${var.stack_name}-snapshot-of-previous-cluster-${local.timestamp_sanitized}"
  db_security_grp_id = "${var.rds_sgs["rds_sgs_${var.network_id}"]}"
  apply_immidiate = var.apply_immidiate
  db_port = var.db_port
  db_instance_count = var.db_instance_count
  stack_name = var.stack_name
  enable_performance_insights = var.enable_performance_insights
  rds_availability_zones = var.azs
  instance_availability_zone = var.set_az == "true" ? var.availability_zone : ""
  publically_accessible = var.publically_accessible
  rds_instance_class = var.rds_instance_class
  db_engine_ver = var.db_engine_ver
  db_engine = var.db_engine
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  env = var.env
  backup_retention_period = var.backup_retention_period
  rds_master_username = var.rds_master_username
  rds_master_password = var.rds_master_password
  dr_region = var.dr_region
  custom_tags = local.tags
  deletion_protection = var.deletion_protection
}
