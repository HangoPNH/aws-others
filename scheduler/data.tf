##############
### Lambda ###
##############

data "aws_iam_role" "lambda_role" {
  name = "lambda-role-${var.infra_env}"
}
