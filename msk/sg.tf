##################
### AWS MSK SG ###
##################

# create security group for msk
resource "aws_security_group" "ciac_msk_sg" {
  name   = "ciac-msk-sg-${var.infra_env}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 9096
    to_port     = 9096
    protocol    = "tcp"
    cidr_blocks = data.aws_subnet.public_cicd_subnet_cidrs[*].cidr_block
    description = "Allow all public cicd connect to msk port"
  }

  ingress {
    from_port   = 9096
    to_port     = 9096
    protocol    = "tcp"
    cidr_blocks = data.aws_subnet.private_app_subnet_cidrs[*].cidr_block
    description = "Allow all private app connect to msk port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags,
    {
      Name = "${var.project_key_tag}-msk-sg-${var.region_name}-${var.infra_env}"
    }
  )
}
