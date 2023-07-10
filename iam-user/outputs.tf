output "access_key_id" {
  value       = var.create_access_key ? aws_iam_access_key.this[0].id : null
  description = "Access key ID for the user"
}

output "secret_access_key" {
  value       = var.create_access_key ? aws_iam_access_key.this[0].secret : null
  description = "Secret of the access key for the user"
  sensitive   = true
}

output "iam_user_arn" {
  value       = aws_iam_user.this.arn
  description = "ARN of the IAM user"
}

output "iam_user_name" {
  value       = aws_iam_user.this.name
  description = "Name of the IAM user"
}

output "iam_user_unique_id" {
  value       = aws_iam_user.this.unique_id
  description = "Unique ID of the IAM user"
}
