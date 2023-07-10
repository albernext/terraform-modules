module "tg_actions_repo" {
  source = "../tg-actions-repo"

  repo_name       = var.tg_actions_repo_name
  description     = var.tg_actions_repo_description
  codeowners_file = var.tg_actions_repo_codeowners_file
}
