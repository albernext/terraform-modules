variable "initial_deploy" {
  description = "Set to true if deploying module for the first time; change to false afterwards"
  type        = bool
}

variable "github_repository_visibility" {
  description = "Visibility of the GitHub repositories"
  type        = string
}

variable "trusted_user_arn" {
  description = "ARN of a manually created IAM user to do the initial platform creation (required if initial_deploy is true)"
  type        = string
  default     = null
}

variable "tf_modules_repo_name" {
  description = "Name of the repository to create for Terraform modules"
  type        = string
  default     = "terraform-modules"
}

variable "tf_modules_repo_description" {
  description = "Description of the repository for Terraform modules"
  type        = string
  default     = "Collection of custom Terraform modules"
}

variable "tf_modules_github_teams" {
  description = "List of teams to give Write access to the Terraform modules repository to"
  type        = set(string)
}

variable "tg_actions_repo_name" {
  description = "Name of the repository to create for Terragrunt actions"
  type        = string
  default     = "terragrunt-actions"
}

variable "tg_actions_repo_description" {
  description = "Description of the repository for Terragrunt actions"
  type        = string
  default     = "Workflows to manage infrasturcture using Terragrunt"
}

variable "tg_actions_github_teams" {
  description = "List of teams to give Write access to the Terragrunt actions repository to"
  type        = set(string)
}

variable "tg_actions_repo_codeowners_file" {
  description = "CODEOWNERS file for the GitHub repository"
  type        = string
}

variable "tg_automation_repo_name" {
  description = "Name of the repository to create for the Terragrunt automation"
  type        = string
  default     = "terragrunt-gitops"
}

variable "tg_automation_repo_description" {
  description = "Description of the repository to create for the Terragrunt automation"
  type        = string
  default     = "Platform to manage cloud infrastructure"
}

variable "tg_automation_github_teams" {
  description = "List of teams to give Write access to the Terragrunt automation repository to"
  type        = set(string)
}

variable "tg_automation_repo_codeowners_file" {
  description = "CODEOWNERS file for the GitHub repository"
  type        = string
}

variable "tg_automation_user_name" {
  description = "Name of the IAM user to create to be used in the workflow"
  type        = string
}

variable "tg_automation_role_name" {
  description = "Name of the role assumed by Terragrunt in the workflow"
  type        = string
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket to create to be used as Terraform state bucket"
  type        = string
}

variable "locks_table_name" {
  description = "Name of the DynamoDB table to create to be used as Terraform locks table"
  type        = string
  default     = "tf-locks"
}

variable "github_org" {
  description = "Name of the GitHub organization where the repositories are stored"
  type        = string
}

variable "github_token_secret_arn" {
  description = "ARN of the Secrets Manager secret containing GitHub personal access token used to run Terragrunt"
  type        = string
}

variable "infracost_api_key_secret_arn" {
  description = "ARN of the Secrets Manager secret containing Infracost API key used to run Terragrunt"
  type        = string
}

variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "eu-west-1"
}
