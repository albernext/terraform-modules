resource "aws_iam_user" "this" {
  name = var.user_name
}

resource "aws_iam_access_key" "this" {
  count = var.create_access_key ? 1 : 0

  user = aws_iam_user.this.name
}

resource "aws_secretsmanager_secret" "access_key" {
  count = var.create_access_key ? 1 : 0

  name = "${aws_iam_user.this.name}-access-key"
}

resource "aws_secretsmanager_secret_version" "access_key" {
  count = var.create_access_key ? 1 : 0

  secret_id = aws_secretsmanager_secret.access_key[0].id

  secret_string = <<EOT
{
  "AWS_ACCESS_KEY_ID": "${aws_iam_access_key.this[0].id}",
  "AWS_SECRET_ACCESS_KEY": "${aws_iam_access_key.this[0].secret}"
}
EOT
}

resource "aws_iam_policy" "this" {
  count = var.attach_policy ? 1 : 0

  name   = aws_iam_user.this.name
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "custom" {
  count = var.attach_policy ? 1 : 0

  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.this[0].arn
}

resource "aws_iam_user_policy_attachment" "aws" {
  for_each = var.aws_managed_policies

  user       = aws_iam_user.this.name
  policy_arn = "arn:aws:iam::aws:policy/${each.key}"
}
