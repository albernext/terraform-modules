module "iam_user" {
  source = "../iam-user"

  user_name = var.user_name

  policy = templatefile("${path.module}/files/iam_user_policy.json.tftpl",
    {
      role_name         = var.role_name
      state_bucket_name = var.state_bucket_name
      locks_table_name  = var.locks_table_name
      region            = local.region
      account_id        = local.account_id
    }
  )

  create_access_key = true
  attach_policy     = true
}
