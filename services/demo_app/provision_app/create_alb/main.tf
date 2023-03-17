##################################################################
# Application Load Balancer
##################################################################

module "alb" {
 #source = "../../../../env/terrafiles/terraform-modules/webapp_lt"
  source = "../../../../../terraform-modules/alb"

  name = var.stack_name

  load_balancer_type = "application"

  vpc_id  = local.alb_vpc_id
  subnets = local.alb_public_subnet
  # Attach security groups
  security_groups = local.alb_sgs


  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
    }
  ]

  target_groups = [
    {
      name_prefix          = "app-tg"
      backend_protocol     = "HTTP"
      protocol_version     = "HTTP1"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-499"
      }

      tags = local.tags
    }
  ]

  tags = local.tags
  lb_tags = local.lb_tags
  target_group_tags = local.target_group_tags
  http_tcp_listeners_tags = local.http_tcp_listeners_tags

}
