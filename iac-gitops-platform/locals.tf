locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = var.github_token_secret_arn
}

data "aws_secretsmanager_secret_version" "infracost_api_key" {
  secret_id = var.infracost_api_key_secret_arn
}
