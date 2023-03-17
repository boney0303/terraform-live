locals {

  instance_public_subnet = "${var.public_subnet["public_subnet_${var.network_id}"]}"
  tags = merge(
    tomap({"CreatedBy" = "Samar"}),
    tomap({"Name" = var.stack_name}),
    var.ec2_instance_tags
  )
}
