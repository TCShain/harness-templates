data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "ecs-service-discovery-tshain-demo-cluster"
    key    = "ecs-service-discovery/tshain-demo/cluster"
    region = "ca-central-1"
  }
}