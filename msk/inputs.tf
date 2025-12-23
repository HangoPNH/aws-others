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
  description = "Repository of the Project"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "infra_env" {
  type        = string
  description = "Infrastructure Environment"
}

variable "vpc_id" {
  type = string
}

variable "private_app_subnet_ids" {
  type = list(string)
}

variable "public_cicd_subnet_ids" {
  type = list(string)
}
###########
### MSK ###
###########

variable "ciac_msk_cluster_name" {
  type = string
}

variable "ciac_msk_cluster_version" {
  type = string
}

variable "number_of_broker_nodes" {
  type = number
}

variable "ciac_msk_brokers_instance_type" {
  type = string
}

variable "ciac_msk_cloudwatch_log_group" {
  type = string
}

variable "ciac_msk_configuration" {
  type = string
}

###########
### MSK ###
###########

variable "cw_retention_in_days" {
  type = number
}
