resource "github_repository" "this" {
  name = var.repo_name

  description = var.description

  visibility = var.visibility

  has_issues      = false
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  delete_branch_on_merge = true

  gitignore_template = "Terraform"

  auto_init = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.this.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
    require_last_push_approval      = true
  }

  enforce_admins = true

  push_restrictions = []
}

resource "github_team_repository" "this" {
  for_each = var.github_teams

  repository = github_repository.this.name

  team_id    = each.key
  permission = "push"
}

resource "github_repository_deploy_key" "this" {
  repository = github_repository.this.name

  title     = "Terragrunt actions"
  key       = var.deploy_key
  read_only = true
}
