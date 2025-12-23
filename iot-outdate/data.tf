##############
### Lambda ###
##############

data "aws_iam_role" "lambda_role" {
  name = "${var.lambda_role}-${var.infra_env}"
}
