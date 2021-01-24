resource "aws_s3_bucket" "microservice_bucket" {
  bucket_prefix = var.bucket_prefix
  acl           = var.acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_arn
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}

resource "aws_s3_bucket_policy" "microservice_bucket_policy" {
  bucket = aws_s3_bucket.microservice_bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}