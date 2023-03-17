locals {
  alb_public_subnet = "${var.public_subnet["public_subnet_${var.network_id}"]}"
  alb_vpc_id        = "${var.vpc_id["vpc_id_${var.network_id}"]}"
  alb_sgs           = "${var.alb_sgs["alb_sgs_${var.network_id}"]}"

  tags = merge(
    tomap({"CreatedBy" = "Samar"}),
    tomap({"Name" = var.stack_name})
  )
  lb_tags = merge(
    tomap({"Create_date_time" = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}),
    tomap({"Resource_Type" = "Application"})
  )
  target_group_tags = merge(
    tomap({"Create_date_time" = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}),
    tomap({"Resource_Type" = "IP"})
  )
  http_tcp_listeners_tags = merge(
    tomap({"Create_date_time" = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}),
    tomap({"Resource_Type" = "HTTP"})
  )

}
