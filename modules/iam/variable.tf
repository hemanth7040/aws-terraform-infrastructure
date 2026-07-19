variable "role_name" {
  description = "IAM Role Name"
  type        = string
}

variable "policy_name" {
  description = "IAM Policy Name"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
  default     = {}
}