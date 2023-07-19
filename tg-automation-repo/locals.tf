locals {
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id

  user_id = module.iam_user.iam_user_unique_id
  role_id = "${var.role_unique_id}:*"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
