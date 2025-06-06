# Infraestructura Voting-App (Terraform + AWS)

Este proyecto define la infraestructura para la aplicación Voting-App usando Terraform, ECS Fargate y otros recursos en AWS.

## Estructura

- `modules/`: módulos reutilizables (network, ecs, sg, etc.)
- `envs/`: entornos separados (`dev`, `test`, `prod`)
- `provider.tf`: configuración del proveedor AWS
- `README.md`: documentación general

## Cómo desplegar

```bash
cd envs/dev
terraform init
terraform apply -var-file=terraform.tfvars

