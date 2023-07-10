# tg-automation-repo

## Description

Creates a GitHub repo to manage resources using Terragrunt following a GitOps approach.

It also creates an IAM user to be used by Terragrunt in the GH Actions workflows, a Terraform state S3 bucket to store the Terraform state files and a DynamoDB table to be used by Terragrunt as a locks table.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.67.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.67.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.29.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_user"></a> [iam\_user](#module\_iam\_user) | ../iam-user | n/a |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.pr_template](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.terragrunt_hcl](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.terragrunt_workflow](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners_file"></a> [codeowners\_file](#input\_codeowners\_file) | CODEOWNERS file for the GitHub repository | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | n/a | yes |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | Name of the GitHub organization where the repositories are stored | `string` | n/a | yes |
| <a name="input_locks_table_name"></a> [locks\_table\_name](#input\_locks\_table\_name) | Name of the DynamoDB table to create to be used as Terraform locks table | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Name of the repository to create | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the role assumed by Terragrunt in the workflow | `string` | n/a | yes |
| <a name="input_role_unique_id"></a> [role\_unique\_id](#input\_role\_unique\_id) | Unique ID of the role assumed by Terragrunt in the workflow | `string` | n/a | yes |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | Name of the S3 bucket to create to be used as Terraform state bucket | `string` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name of the IAM user to create to be used in the workflow | `string` | n/a | yes |
| <a name="input_workflows_repo"></a> [workflows\_repo](#input\_workflows\_repo) | Repository where the GitHub Actions workflows are hosted (owner/repository) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_user_arn"></a> [iam\_user\_arn](#output\_iam\_user\_arn) | ARN of the IAM user |
