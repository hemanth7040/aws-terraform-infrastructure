output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_sg_id" {
  value = module.alb_sg.security_group_id
}