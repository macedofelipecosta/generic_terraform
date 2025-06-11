output "alb_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = module.alb.lb_dns_name
}

output "alb_target_group_arn" {
  description = "ARN del Target Group asociado al ALB"
  value       = module.alb.target_group_arn
}

output "ecs_service_name" {
  description = "Nombre del servicio ECS Fargate"
  value       = module.ecs_fargate.service_name
}

output "ecs_cluster_id" {
  description = "ID del cluster ECS"
  value       = module.ecs_fargate.cluster_id
}

output "vpc_id" {
  description = "ID de la VPC usada"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs de las subnets privadas usadas por ECS"
  value       = module.network.private_subnet_ids
}
