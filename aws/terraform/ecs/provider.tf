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
}

terraform {
  backend "s3" {
    bucket         = "ecs-service-discovery-tshain-demo-cluster"
    key            = "ecs-service-discovery/tshain-demo/vpc"
    region         = "ca-central-1"
    dynamodb_table = "ecs-service-discovery-tshain-demo-cluster"
  }
}