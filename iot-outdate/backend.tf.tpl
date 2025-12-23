terraform {
  backend "s3" {
    bucket = "${TF_S3_BACKEND}"
    key    = "other/iot/terraform-${INFRA_ENV}.tfstate"
    region = "${AWS_REGION}"
  }
}
