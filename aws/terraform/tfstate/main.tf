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

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "${var.namespace}-${var.stage}-${var.name}"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}