output "iam_user_arn" {
  value       = module.tg_automation_repo.iam_user_arn
  description = "ARN of the IAM user used in Terragrunt automation repo"
}
