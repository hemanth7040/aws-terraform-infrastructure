############################################
# IAM
############################################

module "iam" {

  source = "../../modules/iam"
  role_name             = var.role_name
  policy_name           = var.policy_name  
  instance_profile_name = var.instance_profile_name

  tags = local.common_tags

}


############################################
# VPC
############################################

module "vpc" {
  source = "../../modules/vpc"

  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
}

############################################
# ALB Security Group
############################################

module "alb_sg" {

  source = "../../modules/security-group"

  name        = var.alb_sg_name
  description = var.alb_sg_description

  vpc_id = module.vpc.vpc_id

  ingress_rules = var.alb_ingress_rules
  egress_rules  = var.alb_egress_rules
}

############################################
# Application Security Group
############################################

module "app_sg" {

  source = "../../modules/security-group"

  name        = var.app_sg_name
  description = var.app_sg_description

  vpc_id = module.vpc.vpc_id

  ingress_rules = {

    http = {

      from_port = 80
      to_port   = 80
      protocol  = "tcp"

      referenced_security_group_id = module.alb_sg.security_group_id

    }

  }

  egress_rules = var.app_egress_rules
}

############################################
# Database Security Group
############################################

module "db_sg" {

  source = "../../modules/security-group"

  name        = var.db_sg_name
  description = var.db_sg_description

  vpc_id = module.vpc.vpc_id

  ingress_rules = {

    mysql = {

      from_port = 3306
      to_port   = 3306
      protocol  = "tcp"

      referenced_security_group_id = module.app_sg.security_group_id

    }

  }

  egress_rules = var.db_egress_rules
}