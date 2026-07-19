output "role_name" {
  value = module.iam.role_name
}

output "role_arn" {
  value = module.iam.role_arn
}

output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "instance_profile_arn" {
  value = module.iam.instance_profile_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_sg_id" {
  value = module.alb_sg.security_group_id
}