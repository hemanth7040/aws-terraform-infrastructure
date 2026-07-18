##############################
# AWS
##############################

variable "aws_region" {

  description = "AWS Region"
  type        = string

}

variable "aws_profile" {

  description = "AWS CLI Profile"
  type        = string

}

##############################
# S3
##############################

variable "bucket_name" {

  description = "Terraform State Bucket Name"
  type        = string

}

##############################
# DynamoDB
##############################

variable "dynamodb_table_name" {

  description = "Terraform Lock Table"
  type        = string

}