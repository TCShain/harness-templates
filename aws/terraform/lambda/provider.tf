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
    #bucket         = "tshain-harness-app-demo"
    #key            = "ecs-service-discovery/tshain-demo/vpc"
    #region         = "ca-central-1"
  }
}