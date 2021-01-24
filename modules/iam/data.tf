data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    sid = "1"

    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "microservice_policy" {
  statement {
    sid = "2"

    actions = [
      "s3:*"
    ]

    resources = var.bucket_arns
  }

  statement {
    sid     = "3"
    actions = ["*"]

    resources = [
      var.kms_master_key_arn
    ]
  }
}