module "tg_actions_repo" {
  source = "../tg-actions-repo"

  repo_name             = var.tg_actions_repo_name
  description           = var.tg_actions_repo_description
  github_teams          = var.tg_actions_github_teams
  codeowners_file       = var.tg_actions_repo_codeowners_file
  aws_access_key_id     = module.tg_automation_repo.access_key_id
  aws_secret_access_key = module.tg_automation_repo.secret_access_key
  ssh_private_key       = tls_private_key.this.private_key_openssh
  github_token          = data.aws_secretsmanager_secret_version.github_token.secret_string
  infracost_api_key     = data.aws_secretsmanager_secret_version.infracost_api_key.secret_string
  aws_region            = var.aws_region
  state_bucket_name     = var.state_bucket_name
  locks_table_name      = var.locks_table_name
}
