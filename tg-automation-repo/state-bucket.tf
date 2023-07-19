module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.3.0"

  bucket = var.state_bucket_name

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  attach_policy = true

  versioning = {
    status = true
  }

  server_side_encryption_configuration = {
    rule = {
      bucket_key_enabled = false

      apply_server_side_encryption_by_default = {
        kms_master_key_id = "arn:aws:kms:${local.region}:${local.account_id}:alias/aws/s3"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # TODO: usar política generada a partir de data source
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "EnforcedTLS",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.state_bucket_name}",
                "arn:aws:s3:::${var.state_bucket_name}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Sid": "RootAccess",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${local.account_id}:root"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.state_bucket_name}",
                "arn:aws:s3:::${var.state_bucket_name}/*"
            ]
        }
    ]
}
POLICY
}
