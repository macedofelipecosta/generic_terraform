module "network" {
  source          = "../../modules/network"
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  environment     = var.environment
}

module "security_groups" {
  source      = "../../modules/security-groups"
  vpc_id      = module.network.vpc_id
  environment = var.environment
  app_port    = var.app_port
}

module "alb" {
  source             = "../../modules/loadbalancer"
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [module.security_groups.alb_sg_id]
  environment        = var.environment
  target_port        = var.app_port
}

module "ecs_vote" {
  source              = "../../modules/ecs_fargate"
  cluster_name        = "vote-${var.environment}"
  task_family         = "vote-task"
  cpu                 = "256"
  memory              = "512"
  execution_role_arn  = var.ecs_execution_role_arn
  task_role_arn       = var.ecs_task_role_arn
  image               = var.vote_image_url
  container_name      = "vote"
  container_port      = var.app_port
  desired_count       = 1
  subnet_ids          = module.network.public_subnet_ids
  security_group_ids  = [module.security_groups.ecs_sg_id]
  assign_public_ip    = true
  region              = var.aws_region
  target_group_arn    = module.alb.target_group_arn_vote
  tags = {
    Environment = var.environment
    Project     = "voting-app"
  }
}

module "ecs_result" {
  source              = "../../modules/ecs_fargate"
  cluster_name        = "result-${var.environment}"
  task_family         = "result-task"
  cpu                 = "256"
  memory              = "512"
  execution_role_arn  = var.ecs_execution_role_arn
  task_role_arn       = var.ecs_task_role_arn
  image               = var.result_image_url
  container_name      = "result"
  container_port      = var.result_port
  desired_count       = 1
  subnet_ids          = module.network.public_subnet_ids
  security_group_ids  = [module.security_groups.ecs_sg_id]
  assign_public_ip    = true
  region              = var.aws_region
  target_group_arn    = module.alb.target_group_arn_result
  tags = {
    Environment = var.environment
    Project     = "voting-app"
  }
}

module "ecs_worker" {
  source              = "../../modules/ecs_fargate"
  cluster_name        = "worker-${var.environment}"
  task_family         = "worker-task"
  cpu                 = "256"
  memory              = "512"
  execution_role_arn  = var.ecs_execution_role_arn
  task_role_arn       = var.ecs_task_role_arn
  image               = var.worker_image_url
  container_name      = "worker"
  container_port      = 80 # opcional, no se expone
  desired_count       = 1
  subnet_ids          = module.network.public_subnet_ids
  security_group_ids  = [module.security_groups.ecs_sg_id]
  assign_public_ip    = true
  region              = var.aws_region
  # NO lleva target_group_arn porque no va al ALB
  tags = {
    Environment = var.environment
    Project     = "voting-app"
  }
}



