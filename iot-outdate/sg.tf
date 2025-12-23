###########################
### AWS Lambda Function ###
###########################

# create security group for lambda function
resource "aws_security_group" "company_beacon_function_sg" {
  name   = "${var.company_beacon_function}-sg-${var.infra_env}"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.company_beacon_postgres_sg]
    description     = "Allow Lambda connect to RDS PosgreSQL Instance"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-${var.company_beacon_function}-sg-${var.region_name}-${var.infra_env}"
    }
  )
}