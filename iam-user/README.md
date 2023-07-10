# AWS IAM user

## Description

Creates an IAM user.

It features a custom policy and allows AWS managed policies to be attached.

It also optionally generates an access key and store its credentials in a secret in Secrets Manager.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_secretsmanager_secret.access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_policy"></a> [attach\_policy](#input\_attach\_policy) | Attach custom policy specified in the policy input to the user | `bool` | `false` | no |
| <a name="input_aws_managed_policies"></a> [aws\_managed\_policies](#input\_aws\_managed\_policies) | List of the names of AWS managed policies to be attached to the user | `set(string)` | `[]` | no |
| <a name="input_create_access_key"></a> [create\_access\_key](#input\_create\_access\_key) | Create an access key for the user | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | IAM policy to be attached to the user | `string` | `null` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name for the user | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_id"></a> [access\_key\_id](#output\_access\_key\_id) | Access key ID for the user |
| <a name="output_iam_user_arn"></a> [iam\_user\_arn](#output\_iam\_user\_arn) | ARN of the IAM user |
| <a name="output_iam_user_name"></a> [iam\_user\_name](#output\_iam\_user\_name) | Name of the IAM user |
| <a name="output_iam_user_unique_id"></a> [iam\_user\_unique\_id](#output\_iam\_user\_unique\_id) | Unique ID of the IAM user |
| <a name="output_secret_access_key"></a> [secret\_access\_key](#output\_secret\_access\_key) | Secret of the access key for the user |
