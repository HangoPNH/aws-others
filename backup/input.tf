variable "project_key_tag" {
  type        = string
  description = "Key tag of the Project"
  default     = "dwt"
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

##################
### AWS Backup ###
##################

variable "aws_backup_vault_name" {
  type = string
}

variable "aws_backup_plan" {
  type = string
}

variable "aws_backup_delete_after" {
  type = number
}

####################
### EC2 Instance ###
####################

variable "ec2_instance_id" {
  description = "The ID of the EC2 instances to back up"
  type        = list(string)
}

#################
### RDS MySQL ###
#################

variable "rds_instance_id" {
  description = "The ID of the RDS instances to back up"
  type        = list(string)
}
