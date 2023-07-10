variable "repo_name" {
  description = "Name of the repository to create"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
}

variable "github_teams" {
  description = "List of teams to give Write access to the repository to"
  type        = set(string)
}

variable "codeowners_file" {
  description = "CODEOWNERS file for the GitHub repository"
  type        = string
}

variable "user_name" {
  description = "Name of the IAM user to create to be used in the workflow"
  type        = string
}

variable "role_name" {
  description = "Name of the role assumed by Terragrunt in the workflow"
  type        = string
}

variable "role_unique_id" {
  description = "Unique ID of the role assumed by Terragrunt in the workflow"
  type        = string
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket to create to be used as Terraform state bucket"
  type        = string
}

variable "locks_table_name" {
  description = "Name of the DynamoDB table to create to be used as Terraform locks table"
  type        = string
}

variable "workflows_repo" {
  description = "Repository where the GitHub Actions workflows are hosted (owner/repository)"
  type        = string
}

variable "github_org" {
  description = "Name of the GitHub organization where the repositories are stored"
  type        = string
}
