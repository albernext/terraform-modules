locals {
  organization_id = data.aws_organizations_organization.this.id

  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = data.aws_region.current.name

  github_owner         = "eits-lafargeholcim"
  github_commit_author = "SRV-CICD"
  github_commit_email  = "github-ae2e-edc@holcim.com"

  quay_org                = "lafargeholcim"
  quay_robot_account_name = "lafargeholcim+gh_actions_cicd"
  quay_owners_team        = "owners"

  aws_e2e_secrets_account_id = "396508798220"

  aws_secretsmanager_e2e_secrets_account_wildcard_arn = "arn:aws:secretsmanager:eu-west-1:${local.aws_e2e_secrets_account_id}:secret:*"
  aws_kms_key_secretsmanager_arn                      = "arn:aws:kms:eu-west-1:${local.aws_e2e_secrets_account_id}:key/2fd374ec-fbac-4c66-89ca-23d8bdd54de7"
}

data "aws_organizations_organization" "this" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
