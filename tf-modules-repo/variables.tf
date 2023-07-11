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

variable "deploy_key" {
  description = "SSH public key to be used as deploy key to allow access from Terragrunt actions repo"
  type        = string
}
