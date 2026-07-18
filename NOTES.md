# Terraform Learning Notes

Implementation notes, design decisions, and lessons learned while building this repository.

_Last updated: 2026-07-18_

## Contents

- [Repository Design](#repository-design)
- [Design Principles](#design-principles)
- [Security Groups](#security-groups)
- [Lessons Learned](#lessons-learned)
- [Terraform Best Practices Learned](#terraform-best-practices-learned)
- [Commands](#commands)
- [Current Progress](#current-progress)
- [Future Improvements](#future-improvements)

---

## Repository Design

### `modules/`

Contains reusable infrastructure components. No environment-specific values should exist here.

Examples:
- VPC
- Security Group
- EC2
- IAM

### `environments/`

Contains deployment configuration. Environment folders compose reusable modules.

Examples:
- dev
- qa
- prod

---

## Design Principles

- Infrastructure as Code
- Reusable modules
- Environment-specific configuration kept separate from module logic
- Avoid hardcoded resource IDs
- Prefer module outputs over manual values

---

## Security Groups

Implemented using:
- `aws_security_group`
- `aws_vpc_security_group_ingress_rule`
- `aws_vpc_security_group_egress_rule`

Rules are created dynamically using `for_each`, supporting both `cidr_ipv4` and `referenced_security_group_id` rule types.

**Traffic flow:**

```
Internet → ALB → Application → Database
```

- Application accepts traffic only from ALB.
- Database accepts traffic only from Application.

---

## Lessons Learned

- **SG references over CIDR blocks**: referencing a security group ID instead of a CIDR range means rules keep working even if subnet ranges change later — one less thing to update by hand.
- **`for_each` over `count` for SG rules**: using `for_each` with a map keeps rule identity stable across `plan`/`apply` runs, so adding or removing one rule doesn't force Terraform to recreate unrelated ones (which `count` with a list can do).
- **Modules should stay "dumb"**: pushing every environment-specific value (CIDR ranges, instance sizes, names) into `terraform.tfvars` per environment made the modules themselves much easier to reuse without edits.
- **Local state is fine for learning, risky for anything real**: without remote state + locking, there's no protection against two applies running at once or losing the state file — this is the next priority.

---

## Terraform Best Practices Learned

- Use modules for reusable infrastructure.
- Keep environment values inside `terraform.tfvars`.
- Compose infrastructure inside `main.tf`.
- Avoid hardcoded AWS resource IDs.
- Use module outputs to connect resources.
- Prefer security group references over CIDRs when possible.

---

## Commands

| Purpose | Command |
|---|---|
| Initialize | `terraform init` |
| Format | `terraform fmt -recursive` |
| Validate | `terraform validate` |
| Plan | `terraform plan` |
| Apply | `terraform apply` |
| Destroy | `terraform destroy` |

---

## Current Progress

**Completed**
- VPC Module
- Security Group Module
- Environment Configuration
- Local Terraform State

**Next**
- Configure S3 backend
- Configure DynamoDB state locking
- IAM Module
- EC2 Module
- Python EBS Snapshot Automation

---

## Future Improvements

- Remote state
- State locking
- IAM best practices
- Auto scaling
- Load balancer
- RDS
- EKS
- Route53
- CI/CD