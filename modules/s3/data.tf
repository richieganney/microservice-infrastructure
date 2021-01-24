data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "IPAllow"
    effect = "Deny"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:*"
    ]

    resources = [aws_s3_bucket.microservice_bucket.arn]

    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"
      values = [
        var.microservice_instance_ip
      ]
    }
  }
}