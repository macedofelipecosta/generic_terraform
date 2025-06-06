vpc_cidr_block  = "10.2.0.0/16"
public_subnets  = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnets = ["10.2.101.0/24", "10.2.102.0/24"]
azs             = ["us-east-1a", "us-east-1b"]

environment     = "prod"
app_port        = 80

vote_image_url  = "123456789012.dkr.ecr.us-east-1.amazonaws.com/vote:prod"
aws_region      = "us-east-1"

