output "alb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.alb_id
}

output "alb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.alb_arn
}


output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.alb.alb_tg_arns
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.alb.alb_tg_names
}
