variable "vpc_cidr_block" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "azs" { type = list(string) }

variable "environment" {}
variable "app_port" { type = number }

variable "vote_image_url" {}
variable "aws_region" {}

