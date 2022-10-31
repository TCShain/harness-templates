module "ecs_cluster" {
  source = "cloudposse/ecs-cluster/aws"

  namespace = var.namespace
  name      = var.name
  stage     = var.stage

  container_insights_enabled      = false
  capacity_providers_fargate      = true
}

resource "aws_security_group" "ecs_service_discovery_sg" {
  name   = "${var.namespace}.${var.stage}.${var.name}-sg"
  vpc_id = data.terraform_remote_state.vpc.outputs.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}.${var.stage}.${var.name}-sg"
  }
}