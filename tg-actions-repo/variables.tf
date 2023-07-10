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
