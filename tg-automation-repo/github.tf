resource "github_repository" "this" {
  name = var.repo_name

  description = var.description

  visibility = var.visibility

  has_issues      = false
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  allow_auto_merge       = true
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
    require_code_owner_reviews      = true
    require_last_push_approval      = true
  }

  required_status_checks {
    contexts = [
      "Terragrunt Apply",
      "Terragrunt Plan"
    ]
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

resource "github_repository_file" "terragrunt_workflow" {
  repository = github_repository.this.name
  branch     = "main"
  file       = ".github/workflows/terragrunt.yaml"
  content = templatefile("${path.module}/files/terragrunt.yaml.tftpl",
    {
      workflows_repo = "${var.github_org}/${var.workflows_repo}"
    }
  )
  commit_message      = "Add \"Call Terragrunt workflow\" workflow"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
}

resource "github_repository_file" "terragrunt_hcl" {
  repository = github_repository.this.name
  branch     = "main"
  file       = "terragrunt.hcl"
  content = templatefile("${path.module}/files/terragrunt.hcl.tftpl",
    {
      repo_name         = var.repo_name
      workflows_repo    = var.workflows_repo
      role_name         = var.role_name
      state_bucket_name = var.state_bucket_name
      locks_table_name  = var.locks_table_name
      github_org        = var.github_org
    }
  )
  commit_message      = "Add terragrunt.hcl"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
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

resource "github_repository_file" "pr_template" {
  repository          = github_repository.this.name
  branch              = "main"
  file                = ".github/pull_request_template.md"
  content             = file("${path.module}/files/pull_request_template.md")
  commit_message      = "Add PR template"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_message
    ]
  }
}
