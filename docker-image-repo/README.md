# Docker image repo

## Features

Creates a GitHub repo with a Dockerfile and GitHub Actions workflows that build a Docker image and pushes it to an ECR repo, which is also created by this module.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_user"></a> [iam\_user](#module\_iam\_user) | ../iam-user | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [github_actions_secret.aws_access_key_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.aws_secret_access_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch.develop](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_protection.develop](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.dockerfile](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.workflow_develop](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.workflow_main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_tag_protection.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_tag_protection) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_organizations_organization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_secret_github_pat_arn"></a> [aws\_secret\_github\_pat\_arn](#input\_aws\_secret\_github\_pat\_arn) | ARN of the AWS Secret containing the GitHub personal access token | `string` | n/a | yes |
| <a name="input_ecs_task_execution_role"></a> [ecs\_task\_execution\_role](#input\_ecs\_task\_execution\_role) | Name of the ECS task execution role that will be used to retrieve the ECS image | `string` | `"ecsTaskExecutionRole"` | no |
| <a name="input_github_repository_visibility"></a> [github\_repository\_visibility](#input\_github\_repository\_visibility) | Visibility of the GitHub repository | `string` | n/a | yes |
| <a name="input_github_teams"></a> [github\_teams](#input\_github\_teams) | List of teams to give Write permissions to in the GitHub repository | `set(string)` | `[]` | no |
| <a name="input_repo"></a> [repo](#input\_repo) | Name for the GitHub and ECR repositories | `string` | n/a | yes |

## Outputs

No outputs.
