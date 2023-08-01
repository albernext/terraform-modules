module "iam_user" {
  source = "../iam-user"

  user_name = "docker-image-repo-${var.repo}"

  policy = data.aws_iam_policy_document.this.json

  create_access_key = true
  attach_policy     = true
}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      var.aws_secret_github_pat_arn
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "ecr:*"
    ]

    resources = [
      aws_ecr_repository.this.arn
    ]
  }
}
