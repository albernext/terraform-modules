# tf-modules-repo

## Description

Creates a GitHub repo to store a collection of custom Terraform modules.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | n/a | yes |
| <a name="input_github_teams"></a> [github\_teams](#input\_github\_teams) | List of teams to give Write access to the repository to | `set(string)` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Name of the repository to create | `string` | n/a | yes |

## Outputs

No outputs.
