module "iam_assumable_role_custom" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4"

  create_role = true

  trusted_role_arns = [var.initial_deploy ? var.trusted_user_arn : module.tg_automation_repo.iam_user_arn]

  role_name        = var.tg_automation_role_name
  role_description = "Role assumed by ${var.tg_automation_user_name} user to manage resources in this AWS account"

  role_requires_mfa   = false
  attach_admin_policy = true
}
