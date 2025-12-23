################
### MSK Role ###
################

data "aws_iam_policy_document" "ciac_msk_secretmanager_inline_policy" {
  statement {
    sid    = "AWSKafkaResourcePolicy"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["kafka.amazonaws.com"]
    }

    actions   = ["secretsmanager:getSecretValue"]
    resources = [data.aws_secretsmanager_secret.ciac_msk_secretsmanager_secret.arn]
  }
}

resource "aws_secretsmanager_secret_policy" "ciac_msk_secretsmanager_policy" {
  secret_arn = data.aws_secretsmanager_secret.ciac_msk_secretsmanager_secret.arn
  policy     = data.aws_iam_policy_document.ciac_msk_secretmanager_inline_policy.json
}
