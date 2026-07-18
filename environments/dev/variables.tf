##############################
# Environment
##############################

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI Profile"
  type        = string
}

##############################
# VPC
##############################

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "public_subnets" {
  description = "Public Subnets"

  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_app_subnets" {
  description = "Private Application Subnets"

  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_db_subnets" {
  description = "Private Database Subnets"

  type = map(object({
    cidr = string
    az   = string
  }))
}

##############################
# ALB Security Group
##############################

variable "alb_sg_name" {
  description = "ALB Security Group Name"
  type        = string
}

variable "alb_sg_description" {
  description = "ALB Security Group Description"
  type        = string
}

variable "alb_ingress_rules" {
  description = "ALB Ingress Rules"

  type = map(object({
    from_port                    = number
    to_port                      = number
    protocol                     = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
}

variable "alb_egress_rules" {
  description = "ALB Egress Rules"

  type = map(object({
    from_port                    = number
    to_port                      = number
    protocol                     = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
}

##############################
# Application Security Group
##############################

variable "app_sg_name" {
  description = "Application Security Group Name"
  type        = string
}

variable "app_sg_description" {
  description = "Application Security Group Description"
  type        = string
}

variable "app_egress_rules" {
  description = "Application Egress Rules"

  type = map(object({
    from_port                    = number
    to_port                      = number
    protocol                     = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
}

##############################
# Database Security Group
##############################

variable "db_sg_name" {
  description = "Database Security Group Name"
  type        = string
}

variable "db_sg_description" {
  description = "Database Security Group Description"
  type        = string
}

variable "db_egress_rules" {
  description = "Database Egress Rules"

  type = map(object({
    from_port                    = number
    to_port                      = number
    protocol                     = string
    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
}