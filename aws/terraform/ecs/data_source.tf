data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "tshain-harness-app-demo"
    key    = "tfstate/ecs/tshain-cluster"
    region = "ca-central-1"
  }
}