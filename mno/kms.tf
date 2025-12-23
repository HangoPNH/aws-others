data "aws_caller_identity" "current" {}

resource "aws_kms_key" "mno_sns_kms_key" {
  description             = "KMS key for SNS topic encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  policy = jsonencode({
    Version : "2012-10-17",
    Id : "kms-key-policy",
    Statement : [
      # Allow the root account to manage the key
      {
        Sid : "AllowRootAccountAccess",
        Effect : "Allow",
        Principal : {
          AWS : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action : "kms:*",
        Resource : "*"
      },
      # Allow CloudWatch to use the key
      {
        Sid : "Allow_CloudWatch_for_CMK",
        Effect : "Allow",
        Principal : {
          Service : [
            "cloudwatch.amazonaws.com"
          ]
        },
        Action : [
          "kms:Decrypt",
          "kms:GenerateDataKey*"
        ],
        Resource : "*"
      }
    ]
  })
}

resource "aws_kms_alias" "mno_sns_kms_alias" {
  name          = "alias/mno-sns-topic-key-${var.region_name}-${var.infra_env}"
  target_key_id = aws_kms_key.mno_sns_kms_key.id
}
