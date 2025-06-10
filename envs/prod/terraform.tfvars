vpc_cidr_block = "10.0.0.0/16"

public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["us-east-1a", "us-east-1b"]

environment = "prod"

app_port = 80

vote_image_url   = "<tu_account_id>.dkr.ecr.us-east-1.amazonaws.com/vote:latest"
result_image_url = "<tu_account_id>.dkr.ecr.us-east-1.amazonaws.com/result:latest"
result_port      = 8080
worker_image_url = "<tu_account_id>.dkr.ecr.us-east-1.amazonaws.com/worker:latest"

aws_region = "us-east-1"

ecs_execution_role_arn = "arn:aws:iam::<tu_account_id>:role/ecsTaskExecutionRole"
ecs_task_role_arn      = "arn:aws:iam::<tu_account_id>:role/ecsAppTaskRole"
