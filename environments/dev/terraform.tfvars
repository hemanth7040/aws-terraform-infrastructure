##############################
# Environment
##############################

environment = "dev"

aws_region = "ap-south-2"

aws_profile = "default"

##############################
# IAM
##############################

role_name = "dev-ec2-role"
policy_name = "dev-ebs-snapshot-policy"
instance_profile_name = "dev-ec2-instance-profile"

##############################
# VPC
##############################

vpc_cidr = "10.0.0.0/16"

public_subnets = {

  public-a = {
    cidr = "10.0.1.0/24"
    az   = "ap-south-2a"
  }

  public-b = {
    cidr = "10.0.2.0/24"
    az   = "ap-south-2b"
  }
}

private_app_subnets = {

  app-a = {
    cidr = "10.0.11.0/24"
    az   = "ap-south-2a"
  }

  app-b = {
    cidr = "10.0.12.0/24"
    az   = "ap-south-2b"
  }
}

private_db_subnets = {

  db-a = {
    cidr = "10.0.21.0/24"
    az   = "ap-south-2a"
  }

  db-b = {
    cidr = "10.0.22.0/24"
    az   = "ap-south-2b"
  }
}

##############################
# ALB Security Group
##############################

alb_sg_name = "alb-sg"

alb_sg_description = "Application Load Balancer Security Group"

alb_ingress_rules = {

  http = {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
  }

  https = {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
  }
}

alb_egress_rules = {

  all = {
    from_port = -1
    to_port   = -1
    protocol  = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }
}

##############################
# Application Security Group
##############################

app_sg_name = "app-sg"

app_sg_description = "Application EC2 Security Group"

app_egress_rules = {

  all = {
    from_port = -1
    to_port   = -1
    protocol  = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }
}

##############################
# Database Security Group
##############################

db_sg_name = "db-sg"

db_sg_description = "Database Security Group"

db_egress_rules = {

  all = {
    from_port = -1
    to_port   = -1
    protocol  = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }
}