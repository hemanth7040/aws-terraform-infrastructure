variable "name" {
  description = "Security Group Name"
  type        = string
}

variable "description" {
  description = "Security Group Description"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ingress_rules" {
  description = "Ingress Rules"

  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string

    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
}

variable "egress_rules" {
  description = "Egress Rules"

  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string

    cidr_ipv4                    = optional(string)
    referenced_security_group_id = optional(string)
  }))
}
