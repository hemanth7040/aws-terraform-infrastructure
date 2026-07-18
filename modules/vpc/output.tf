output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"

  value = {
    for name, subnet in aws_subnet.public :
    name => subnet.id
  }
}

output "private_app_subnet_ids" {
  description = "Private application subnet IDs"

  value = {
    for name, subnet in aws_subnet.private_app :
    name => subnet.id
  }
}

output "private_db_subnet_ids" {
  description = "Private database subnet IDs"

  value = {
    for name, subnet in aws_subnet.private_db :
    name => subnet.id
  }
}