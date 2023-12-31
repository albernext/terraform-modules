resource "github_repository" "this" {
  name = var.repo_name

  description = var.description

  visibility = var.visibility

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

resource "github_actions_secret" "infracost_api_key" {
  repository      = github_repository.this.name
  secret_name     = "INFRACOST_API_KEY"
  plaintext_value = var.infracost_api_key
}

resource "github_actions_secret" "ssh_private_key" {
  repository      = github_repository.this.name
  secret_name     = "SSH_PRIVATE_KEY"
  plaintext_value = var.ssh_private_key
}

resource "github_actions_variable" "aws_region" {
  repository    = github_repository.this.name
  variable_name = "AWS_REGION"
  value         = var.aws_region
}

resource "github_actions_variable" "tf_state_bucket" {
  repository    = github_repository.this.name
  variable_name = "TF_STATE_BUCKET"
  value         = var.state_bucket_name
}

resource "github_actions_variable" "tf_locks_table" {
  repository    = github_repository.this.name
  variable_name = "TF_LOCKS_TABLE"
  value         = var.locks_table_name
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
