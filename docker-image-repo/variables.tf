variable "repo" {
  type        = string
  description = "Name for the GitHub and ECR repositories"
}

variable "github_repository_visibility" {
  description = "Visibility of the GitHub repository"
  type        = string
}

variable "github_teams" {
  type        = set(string)
  description = "List of teams to give Write permissions to in the GitHub repository"
  default     = []
}

variable "aws_secret_github_pat_arn" {
  type        = string
  description = "ARN of the AWS Secret containing the GitHub personal access token"
}

variable "ecs_task_execution_role" {
  type        = string
  description = "Name of the ECS task execution role that will be used to retrieve the ECS image"
  default     = "ecsTaskExecutionRole"
}
