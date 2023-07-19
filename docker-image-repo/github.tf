resource "github_repository" "this" {
  name = var.repo

  visibility   = var.github_repository_visibility
  has_issues   = false
  has_projects = false
  has_wiki     = false
  auto_init    = true
}

resource "github_branch" "develop" {
  repository = var.repo

  branch = "develop"

  depends_on = [
    github_repository.this
  ]
}

resource "github_branch_protection" "main" {
  repository_id = var.repo

  pattern        = "main"
  enforce_admins = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }

  depends_on = [
    github_repository.this
  ]
}

resource "github_branch_protection" "develop" {
  repository_id = var.repo

  pattern        = "develop"
  enforce_admins = true

  depends_on = [
    github_repository.this
  ]
}

resource "github_repository_tag_protection" "this" {
  repository = var.repo
  pattern    = "v*"

  depends_on = [
    github_repository.this
  ]
}

resource "github_team_repository" "this" {
  for_each = var.github_teams

  repository = var.repo

  team_id    = each.key
  permission = "push"

  depends_on = [
    github_repository.this
  ]
}

resource "github_repository_file" "dockerfile" {
  repository = var.repo

  branch = github_branch.develop.branch

  file           = "Dockerfile"
  content        = ""
  commit_message = "Add Dockerfile"

  lifecycle {
    ignore_changes = [
      content,
      commit_message
    ]
  }
}

resource "github_repository_file" "workflow_develop" {
  repository = var.repo

  branch = github_branch.develop.branch

  file = ".github/workflows/develop.yaml"
  content = templatefile("${path.module}/files/develop.yaml.tftpl",
    {
      repo                      = var.repo
      aws_secret_github_pat_arn = var.aws_secret_github_pat_arn
      aws_account_id            = local.aws_account_id
    }
  )
  commit_message = "Add develop workflow"

  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
}

resource "github_repository_file" "workflow_main" {
  repository = var.repo

  branch = github_branch.develop.branch

  file = ".github/workflows/main.yaml"
  content = templatefile("${path.module}/files/main.yaml.tftpl",
    {
      repo                      = var.repo
      aws_secret_github_pat_arn = var.aws_secret_github_pat_arn
      aws_account_id            = local.aws_account_id
    }
  )
  commit_message = "Add main workflow"

  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
}

resource "github_actions_secret" "aws_access_key_id" {
  repository      = var.repo
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = module.service-account.access_key_id
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository      = var.repo
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = module.service-account.secret_access_key
}
