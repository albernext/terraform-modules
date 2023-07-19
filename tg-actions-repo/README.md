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
| [github_actions_secret.aws_access_key_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.aws_secret_access_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.github_token](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.infracost_api_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.ssh_private_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_variable.aws_region](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_actions_variable.tf_locks_table](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_actions_variable.tf_state_bucket](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key_id"></a> [aws\_access\_key\_id](#input\_aws\_access\_key\_id) | ID of the access key of the IAM user used to run Terragrunt | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to use | `string` | n/a | yes |
| <a name="input_aws_secret_access_key"></a> [aws\_secret\_access\_key](#input\_aws\_secret\_access\_key) | Secret of the access key of the IAM user used to run Terragrunt | `string` | n/a | yes |
| <a name="input_codeowners_file"></a> [codeowners\_file](#input\_codeowners\_file) | CODEOWNERS file for the GitHub repository | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | n/a | yes |
| <a name="input_github_teams"></a> [github\_teams](#input\_github\_teams) | List of teams to give Write access to the repository to | `set(string)` | n/a | yes |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | GitHub personal access token used to run Terragrunt | `string` | n/a | yes |
| <a name="input_infracost_api_key"></a> [infracost\_api\_key](#input\_infracost\_api\_key) | Infracost API key used to run Terragrunt | `string` | n/a | yes |
| <a name="input_locks_table_name"></a> [locks\_table\_name](#input\_locks\_table\_name) | Name of the DynamoDB table used as Terraform locks table | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Name of the repository to create | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | SSH private key used to access Terraform modules repo | `string` | n/a | yes |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | Name of the S3 bucket used as Terraform state bucket | `string` | n/a | yes |

## Outputs

No outputs.
