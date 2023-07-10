module "tg_automation_repo" {
  source = "../tg-automation-repo"

  repo_name         = var.tg_automation_repo_name
  description       = var.tg_automation_repo_description
  codeowners_file   = var.tg_automation_repo_codeowners_file
  user_name         = var.tg_automation_user_name
  role_name         = var.tg_automation_role_name
  role_unique_id    = module.iam_assumable_role_custom.iam_role_unique_id
  state_bucket_name = var.tg_automation_state_bucket_name
  locks_table_name  = var.tg_automation_locks_table_name
  workflows_repo    = var.tg_actions_repo_name
  github_org        = var.github_org
}
