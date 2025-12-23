terraform {
  backend "s3" {
    bucket = "terraform-company-tfstate-${INFRA_ENV}"
    key    = "${AWS_REGION}/${INFRA_ENV}/others/mno/terraform.tfstate"
    region = "ap-southeast-2"
  }
}
