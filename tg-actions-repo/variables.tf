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

variable "aws_access_key_id" {
  description = "ID of the access key of the IAM user used to run Terragrunt"
  type        = string
}

variable "aws_secret_access_key" {
  description = "Secret of the access key of the IAM user used to run Terragrunt"
  type        = string
}

variable "ssh_private_key" {
  description = "SSH private key used to access Terraform modules repo"
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token used to run Terragrunt"
  type        = string
}

variable "infracost_api_key" {
  description = "Infracost API key used to run Terragrunt"
  type        = string
}

variable "aws_region" {
  description = "AWS region to use"
  type        = string
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket used as Terraform state bucket"
  type        = string
}

variable "locks_table_name" {
  description = "Name of the DynamoDB table used as Terraform locks table"
  type        = string
}
