variable "project_key_tag" {
  type        = string
  description = "Key tag of the Project"
}

variable "project_name" {
  type        = string
  description = "Name of the Project"
}

variable "region_name" {
  type        = string
  description = "Region of the Project"
}

variable "repo_name" {
  type        = string
  description = "Repo of the Project"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure Environment"
}

###########
### VPC ###
###########

variable "vpc_id" {
  type = string
}

variable "private_app_subnet_ids" {
  type        = list(string)
  description = "The Private Subnet IDs of App"
}

##############
### Lambda ###
##############

# lambda
variable "lambda_role" {
  type = string
}

variable "company_beacon_function" {
  type = string
}

variable "company_beacon_function_timeout" {
  type = number
}

variable "company_beacon_function_log_retention" {
  type = number
}

variable "company_beacon_secret" {
  type = string
}

variable "version_stage" {
  type = string
}

# layer
variable "company_beacon_lambda_layer_file" {
  type = string
}

# sg
variable "company_beacon_postgres_sg" {
  type = string
}

###########
### IOT ###
###########

variable "iot_topic_rule_name" {
  type = string
}
