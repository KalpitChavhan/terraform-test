# Terraform AWS 3-Tier Multi-Environment Infrastructure

## Overview

This project demonstrates a **production-style AWS infrastructure** built using **Terraform modules**, supporting multiple environments:

* **dev**
* **stage**
* **prod**

Each environment provisions a complete **3-tier architecture** with isolated networking and scalable components.

---

## Architecture

```text
Internet
   ↓
Application Load Balancer (ALB)
   ↓
EC2 Instances (Multi-AZ)
   ↓
Amazon RDS (Private Subnets)
```

---

## Key Features

*  Modular Terraform architecture
*  Multi-environment deployment (dev, stage, prod)
*  Custom VPC per environment
*  Public & private subnets across multiple AZs
*  Application Load Balancer with target groups
*  High availability EC2 instances
*  RDS in private subnet group
*  Layered security (ALB → EC2 → RDS)
*  Remote state with S3 backend
*  State locking enabled

---

## Project Structure

```bash
terraform-aws-infra/
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   ├── rds/
│
├── env/
│   ├── dev/
│   ├── stage/
│   ├── prod/
│
├── backend/
├── README.md
```

---

## Environment Strategy

| Environment | CIDR        |
| ----------- | ----------- |
| dev         | 10.0.0.0/16 |
| stage       | 10.1.0.0/16 |
| prod        | 10.2.0.0/16 |

---

## Backend (Remote State)

```hcl
backend "s3" {
  bucket       = "your-bucket-name"
  key          = "env/terraform.tfstate"
  region       = "ap-south-1"
  use_lockfile = true
}
```

---

## Usage

```bash
terraform init
terraform plan
terraform apply
```

---

## Outputs

* ALB DNS (entry point)
* EC2 public IPs
* RDS endpoint

---

## Security Design

* ALB → open to internet (HTTP)
* EC2 → only accessible from ALB
* RDS → only accessible from EC2
* DB deployed in private subnets

---

## Future Enhancements

* Auto Scaling Group (ASG)
* NAT Gateway for private subnets
* CI/CD (GitHub Actions)
* Secrets Manager integration
* Monitoring with CloudWatch

---

## Learning

* Designing scalable AWS infrastructure
* Writing reusable Terraform modules
* Implementing multi-environment architecture
* Managing remote Terraform state
* Applying real-world networking concepts

---

## Author

**Kalpit Chavhan**

---
