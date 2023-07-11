module "tg_actions_repo" {
  source = "../tg-actions-repo"

  repo_name             = var.tg_actions_repo_name
  description           = var.tg_actions_repo_description
  github_teams          = var.tg_actions_github_teams
  codeowners_file       = var.tg_actions_repo_codeowners_file
  aws_access_key_id     = module.tg_automation_repo.access_key_id
  aws_secret_access_key = module.tg_automation_repo.secret_access_key
  ssh_private_key       = tls_private_key.this.private_key_openssh
  github_token          = var.github_token
  infracost_api_key     = var.infracost_api_key
  aws_region            = var.aws_region
  state_bucket_name     = var.state_bucket_name
  locks_table_name      = var.locks_table_name
}
