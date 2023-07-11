resource "github_repository" "this" {
  name = var.repo_name

  description = var.description

  visibility = "public"

  has_issues      = false
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  delete_branch_on_merge = true

  auto_init = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.this.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
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

resource "github_actions_secret" "aws_access_key_id" {
  repository      = github_repository.this.name
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = var.aws_access_key_id
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository      = github_repository.this.name
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = var.aws_secret_access_key
}

resource "github_actions_secret" "github_token" {
  repository      = github_repository.this.name
  secret_name     = "GH_TOKEN"
  plaintext_value = var.github_token
}

resource "github_actions_secret" "ssh_private_key" {
  repository      = github_repository.this.name
  secret_name     = "SSH_PRIVATE_KEY"
  plaintext_value = var.ssh_private_key
}

resource "github_repository_file" "codeowners" {
  repository          = github_repository.this.name
  branch              = "main"
  file                = "CODEOWNERS"
  content             = file(var.codeowners_file)
  commit_message      = "Add CODEOWNERS"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
}
