# iac-gitops-platform

## Description

Deploys full IaC GitOps platform.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.67.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.29.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_assumable_role_custom"></a> [iam\_assumable\_role\_custom](#module\_iam\_assumable\_role\_custom) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 4 |
| <a name="module_tf_modules_repo"></a> [tf\_modules\_repo](#module\_tf\_modules\_repo) | ../tf-modules-repo | n/a |
| <a name="module_tg_actions_repo"></a> [tg\_actions\_repo](#module\_tg\_actions\_repo) | ../tg-actions-repo | n/a |
| <a name="module_tg_automation_repo"></a> [tg\_automation\_repo](#module\_tg\_automation\_repo) | ../tg-automation-repo | n/a |

## Resources

| Name | Type |
|------|------|
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_secretsmanager_secret_version.github_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_secretsmanager_secret_version.infracost_api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to use | `string` | `"eu-west-1"` | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | Name of the GitHub organization where the repositories are stored | `string` | n/a | yes |
| <a name="input_github_repository_visibility"></a> [github\_repository\_visibility](#input\_github\_repository\_visibility) | Visibility of the GitHub repositories | `string` | n/a | yes |
| <a name="input_github_token_secret_arn"></a> [github\_token\_secret\_arn](#input\_github\_token\_secret\_arn) | ARN of the Secrets Manager secret containing GitHub personal access token used to run Terragrunt | `string` | n/a | yes |
| <a name="input_infracost_api_key_secret_arn"></a> [infracost\_api\_key\_secret\_arn](#input\_infracost\_api\_key\_secret\_arn) | ARN of the Secrets Manager secret containing Infracost API key used to run Terragrunt | `string` | n/a | yes |
| <a name="input_initial_deploy"></a> [initial\_deploy](#input\_initial\_deploy) | Set to true if deploying module for the first time; change to false afterwards | `bool` | n/a | yes |
| <a name="input_locks_table_name"></a> [locks\_table\_name](#input\_locks\_table\_name) | Name of the DynamoDB table to create to be used as Terraform locks table | `string` | `"tf-locks"` | no |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | Name of the S3 bucket to create to be used as Terraform state bucket | `string` | n/a | yes |
| <a name="input_tf_modules_github_teams"></a> [tf\_modules\_github\_teams](#input\_tf\_modules\_github\_teams) | List of teams to give Write access to the Terraform modules repository to | `set(string)` | n/a | yes |
| <a name="input_tf_modules_repo_description"></a> [tf\_modules\_repo\_description](#input\_tf\_modules\_repo\_description) | Description of the repository for Terraform modules | `string` | `"Collection of custom Terraform modules"` | no |
| <a name="input_tf_modules_repo_name"></a> [tf\_modules\_repo\_name](#input\_tf\_modules\_repo\_name) | Name of the repository to create for Terraform modules | `string` | `"terraform-modules"` | no |
| <a name="input_tg_actions_github_teams"></a> [tg\_actions\_github\_teams](#input\_tg\_actions\_github\_teams) | List of teams to give Write access to the Terragrunt actions repository to | `set(string)` | n/a | yes |
| <a name="input_tg_actions_repo_codeowners_file"></a> [tg\_actions\_repo\_codeowners\_file](#input\_tg\_actions\_repo\_codeowners\_file) | CODEOWNERS file for the GitHub repository | `string` | n/a | yes |
| <a name="input_tg_actions_repo_description"></a> [tg\_actions\_repo\_description](#input\_tg\_actions\_repo\_description) | Description of the repository for Terragrunt actions | `string` | `"Workflows to manage infrasturcture using Terragrunt"` | no |
| <a name="input_tg_actions_repo_name"></a> [tg\_actions\_repo\_name](#input\_tg\_actions\_repo\_name) | Name of the repository to create for Terragrunt actions | `string` | `"terragrunt-actions"` | no |
| <a name="input_tg_automation_github_teams"></a> [tg\_automation\_github\_teams](#input\_tg\_automation\_github\_teams) | List of teams to give Write access to the Terragrunt automation repository to | `set(string)` | n/a | yes |
| <a name="input_tg_automation_repo_codeowners_file"></a> [tg\_automation\_repo\_codeowners\_file](#input\_tg\_automation\_repo\_codeowners\_file) | CODEOWNERS file for the GitHub repository | `string` | n/a | yes |
| <a name="input_tg_automation_repo_description"></a> [tg\_automation\_repo\_description](#input\_tg\_automation\_repo\_description) | Description of the repository to create for the Terragrunt automation | `string` | `"Platform to manage cloud infrastructure"` | no |
| <a name="input_tg_automation_repo_name"></a> [tg\_automation\_repo\_name](#input\_tg\_automation\_repo\_name) | Name of the repository to create for the Terragrunt automation | `string` | `"terragrunt-gitops"` | no |
| <a name="input_tg_automation_role_name"></a> [tg\_automation\_role\_name](#input\_tg\_automation\_role\_name) | Name of the role assumed by Terragrunt in the workflow | `string` | n/a | yes |
| <a name="input_tg_automation_user_name"></a> [tg\_automation\_user\_name](#input\_tg\_automation\_user\_name) | Name of the IAM user to create to be used in the workflow | `string` | n/a | yes |
| <a name="input_trusted_user_arn"></a> [trusted\_user\_arn](#input\_trusted\_user\_arn) | ARN of a manually created IAM user to do the initial platform creation (required if initial\_deploy is true) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_user_arn"></a> [iam\_user\_arn](#output\_iam\_user\_arn) | ARN of the IAM user used in Terragrunt automation repo |
