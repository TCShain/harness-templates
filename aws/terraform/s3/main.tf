module "s3_bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "3.0.0"

  namespace = var.namespace
  stage     = var.stage
  name      = var.name

  acl                = "private"
  enabled            = true
  user_enabled       = false
  versioning_enabled = true
}