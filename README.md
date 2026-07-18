# 🏗️ AWS Infrastructure with Terraform

![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Status](https://img.shields.io/badge/status-in--progress-yellow?style=for-the-badge)
![License](https://img.shields.io/badge/license-Educational-blue?style=for-the-badge)

Reusable Terraform modules and environment configurations for provisioning AWS infrastructure, built to learn Infrastructure as Code (IaC) while creating real infrastructure for downstream Python AWS automation projects.

## Project Goals

- Learn Terraform fundamentals
- Build reusable, production-style Terraform modules
- Manage infrastructure using Infrastructure as Code
- Reuse infrastructure across multiple Python AWS automation projects

---

## Repository Structure

```text
.
├── docs
├── environments
│   └── dev
├── modules
│   ├── alb
│   ├── ec2
│   ├── ecr
│   ├── eks
│   ├── iam
│   ├── rds
│   ├── route53
│   ├── security-group
│   └── vpc
├── NOTES.md
└── README.md
```

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.6
- AWS account with configured credentials (`aws configure` or environment variables)
- AWS CLI >= 2.x
- An S3 bucket + DynamoDB table if using the remote backend (see [Upcoming](#current-status))

---

## Getting Started

```bash
# Clone the repo
git clone https://github.com/hemanth7040/aws-terraform-infrastructure.git
cd aws-terraform-infrastructure

# Move into the environment you want to provision
cd environments/dev

# Initialize Terraform (downloads providers, sets up backend)
terraform init

# Preview changes
terraform plan

# Apply changes
terraform apply

# Tear down when done
terraform destroy
```

---

## Modules

| Module | Status | Description |
|---|---|---|
| `vpc` | ✅ Complete | Custom VPC, public/private-app/private-db subnets, Internet Gateway, route tables & associations |
| `security-group` | ✅ Complete | Reusable SG module — CIDR-based and SG-referenced ingress/egress rules via `for_each` |
| `iam` | 🔜 Upcoming | IAM roles, policies, and instance profiles |
| `ec2` | 🔜 Upcoming | EC2 instance provisioning |
| `alb` | 🔜 Upcoming | Application Load Balancer + target groups |
| `rds` | 🔜 Upcoming | Managed relational database |
| `ecr` | 🔜 Upcoming | Container image repository |
| `route53` | 🔜 Upcoming | DNS zones and records |
| `eks` | 🔜 Upcoming | Managed Kubernetes cluster |

### Example usage (VPC module)

```hcl
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_app_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  private_db_subnets   = ["10.0.21.0/24", "10.0.22.0/24"]
  environment          = "dev"
}
```

---

## Environment

Current environment: `environments/dev`

Contains:
- Provider configuration
- Input variables
- Outputs
- Backend configuration
- Environment-specific values

---

## Architecture

**Network layout**

```
                         Internet
                             │
                       Internet Gateway
                             │
                      ┌──────┴──────┐
                      │ Public Subnet│
                      └──────┬──────┘
                             │
                    ┌────────┴────────┐
                    │ Private App     │
                    │ Subnet          │
                    └────────┬────────┘
                             │
                    ┌────────┴────────┐
                    │ Private DB      │
                    │ Subnet          │
                    └─────────────────┘
```

**Security group chain**

```
Internet → ALB SG → Application SG → Database SG
```

Each layer only accepts traffic from the layer directly above it, enforced via SG-referenced ingress rules in the `security-group` module.

---

## Technologies

- Terraform
- AWS
- Git / GitHub

---

## Current Status

**Completed**
- VPC Module
- Security Group Module
- Development Environment
- Successful Terraform Provisioning

**Upcoming**
- Remote Backend (S3 + DynamoDB)
- IAM Module
- EC2 Module
- ALB Module
- RDS Module
- ECR Module
- Route53 Module
- EKS Module

---

## Related Projects

This infrastructure is built to be reused by AWS Python automation projects, including:
- EBS Snapshot Automation
- EC2 Automation
- S3 Automation
- RDS Automation

---

## License

This repository is created for learning and educational purposes. Feel free to reference or fork it.