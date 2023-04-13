terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# terraform {
#   backend "s3" {
#     bucket         = "ecs-service-discovery-tshain-demo-cluster"
#     key            = "ecs-service-discovery/tshain-demo/cluster"
#     region         = "ca-central-1"
#     dynamodb_table = "ecs-service-discovery-tshain-demo-cluster"
#   }
# }
