###################
### AWS MSK KMS ###
###################

resource "aws_kms_key" "ciac_msk_kms_key" {
  description             = "This key is used to encrypt ecr"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-msk-kms-${var.region_name}-${var.infra_env}"
    }
  )
}

resource "aws_kms_alias" "key_alias_msk" {
  name          = "alias/ciac_msk_kms_key-${var.region_name}-${var.infra_env}"
  target_key_id = aws_kms_key.ciac_msk_kms_key.key_id
}
