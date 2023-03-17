locals {
  timestamp = timestamp()
  timestamp_sanitized = replace(local.timestamp, "/[-| |T|Z|:]/", "")

  tags = merge(
    tomap({"Service" = var.stack_name}),
    tomap({"CreatedBy" = "Samar"}),
    tomap({"DRCopyRDS" = var.dr_region}),
    tomap({"LastMaintenanceBy" = var.owner}),
    tomap({"Name" = var.stack_name}),
    var.security_tags,
    var.account_tags
  )
}