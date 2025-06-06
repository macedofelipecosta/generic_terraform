variable "ami_id" {
  description = "AMI ID de la instancia"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia (por ejemplo, t2.micro)"
  type        = string
}

variable "subnet_id" {
  description = "Subred donde se lanza la instancia"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de IDs de Security Groups"
  type        = list(string)
}

variable "key_name" {
  description = "Nombre del Key Pair SSH"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Nombre del entorno (dev/test/prod)"
  type        = string
}

