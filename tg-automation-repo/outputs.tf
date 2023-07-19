output "iam_user_arn" {
  value       = module.iam_user.iam_user_arn
  description = "ARN of the IAM user"
}

output "access_key_id" {
  value       = module.iam_user.access_key_id
  description = "Access key ID for the user"
}

output "secret_access_key" {
  value       = module.iam_user.secret_access_key
  description = "Secret of the access key for the user"
  sensitive   = true
}
