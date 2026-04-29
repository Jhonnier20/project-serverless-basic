data "aws_iam_policy_document" "assume_role_feedback_function" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "feedback_function_role" {
  name               = var.role_feedback_function_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_feedback_function.json
}

data "aws_iam_policy_document" "origin_bucket_policy" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalReadWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.feedback_ui_app_s3.arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.feedback_cf_distribution.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "feedback_s3_policy" {
  bucket = aws_s3_bucket.feedback_ui_app_s3.bucket
  policy = data.aws_iam_policy_document.origin_bucket_policy.json
}
