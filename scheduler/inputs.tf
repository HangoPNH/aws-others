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

##############
### Lambda ###
##############

variable "ec2_instance_ids" {
  type = string
}

variable "db_instance_identifiers" {
  type = string
}

# ec2
variable "start_ec2_function" {
  type = string
}

variable "start_ec2_function_timeout" {
  type = number
}

variable "start_ec2_function_log_retention" {
  type = number
}

variable "stop_ec2_function" {
  type = string
}

variable "stop_ec2_function_timeout" {
  type = number
}

variable "stop_ec2_function_log_retention" {
  type = number
}

# rds
variable "start_rds_function" {
  type = string
}

variable "start_rds_function_timeout" {
  type = number
}

variable "start_rds_function_log_retention" {
  type = number
}

variable "stop_rds_function" {
  type = string
}

variable "stop_rds_function_timeout" {
  type = number
}

variable "stop_rds_function_log_retention" {
  type = number
}