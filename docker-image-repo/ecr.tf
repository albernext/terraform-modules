resource "aws_ecr_repository" "this" {
  name = var.repo
}

resource "aws_ecr_repository_policy" "this" {
  repository = aws_ecr_repository.this[0].name
  policy     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability"
      ],
      "Condition": {
        "StringLike": {
          "aws:PrincipalArn": "arn:aws:iam::${local.aws_account_id}:role/${var.ecs_task_execution_role}"
        }
      }
    }
  ]
}
POLICY
}
