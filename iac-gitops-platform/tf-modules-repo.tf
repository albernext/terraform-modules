module "tf_modules_repo" {
  source = "../tf-modules-repo"

  repo_name    = var.tf_modules_repo_name
  visibility   = var.github_repository_visibility
  description  = var.tf_modules_repo_description
  github_teams = var.tf_modules_github_teams
  deploy_key   = tls_private_key.this.public_key_openssh
}
