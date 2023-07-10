# tg-actions-repo

## Description

Creates a GitHub repo to store workflows to manage cloud infrastructure using Terragrunt.

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
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners_file"></a> [codeowners\_file](#input\_codeowners\_file) | CODEOWNERS file for the GitHub repository | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Name of the repository to create | `string` | n/a | yes |

## Outputs

No outputs.
