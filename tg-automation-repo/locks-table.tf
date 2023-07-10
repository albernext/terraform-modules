resource "aws_dynamodb_table" "this" {
  name = var.locks_table_name

  hash_key                    = "LockID"
  billing_mode                = "PAY_PER_REQUEST"
  deletion_protection_enabled = true

  attribute {
    name = "LockID"
    type = "S"
  }
}
