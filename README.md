# terraform-aws-infrastructure
Provisioned a secure AWS infrastructure using Terraform including a custom VPC, public/private subnets, NAT Gateway, Bastion Host, private EC2 instances, and MySQL RDS following Infrastructure as Code (IaC) best practices.

# AWS Infrastructure Provisioning using Terraform

## Overview

This project provisions a secure AWS infrastructure using Terraform following Infrastructure as Code (IaC) principles.

The infrastructure includes:

- Custom VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Bastion Host
- Private EC2 Instance
- MySQL RDS Database
- Security Groups
- Route Tables and Associations

The architecture is designed to follow AWS networking and security best practices by placing application resources in private subnets and allowing administrative access through a Bastion Host.

---

## Architecture

```text
Internet
    │
    ▼
Internet Gateway
    │
    ▼
Public Subnet
    │
    ├── Bastion Host
    └── NAT Gateway
             │
             ▼
      Private Subnet
             │
             ├── Private EC2
             └── MySQL RDS
```

---

## AWS Services Used

- Amazon VPC
- Amazon EC2
- Amazon RDS (MySQL)
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Elastic IP

---

## Project Structure

```text
terraform-aws-infrastructure/
│
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── main.tf
│
└── modules/
    ├── vpc/
    ├── ec2/
    └── rds/
```

---

## Features

### VPC Module

- Creates a custom VPC
- Creates public and private subnets
- Configures Internet Gateway
- Configures NAT Gateway
- Creates route tables and associations

### EC2 Module

- Creates Bastion Host
- Creates Private EC2 Instance
- Creates Security Groups
- Creates SSH Key Pair

### RDS Module

- Creates MySQL RDS Instance
- Creates DB Subnet Group
- Creates RDS Security Group

---

## Security Design

- Bastion Host deployed in Public Subnet
- Application EC2 deployed in Private Subnet
- RDS deployed in Private Subnets
- Direct internet access disabled for Private EC2 and RDS
- SSH access to Private EC2 allowed only through Bastion Host
- MySQL access allowed only from Private EC2 Security Group

---

## Prerequisites

- AWS Account
- AWS CLI Configured
- Terraform >= 1.5
- SSH Key Pair

---

## Deployment Steps

Initialize Terraform:

```bash
terraform init
```

Validate Configuration:

```bash
terraform validate
```

Review Execution Plan:

```bash
terraform plan
```

Deploy Infrastructure:

```bash
terraform apply
```

Destroy Infrastructure:

```bash
terraform destroy
```

---

## Outputs

After deployment Terraform displays:

- Bastion Host Public IP
- Private EC2 Private IP
- RDS Endpoint

---

## Skills Demonstrated

- Terraform Modules
- Infrastructure as Code (IaC)
- AWS Networking
- VPC Design
- EC2 Provisioning
- RDS Deployment
- Security Groups
- NAT Gateway Configuration
- Bastion Host Architecture
- Terraform Variables and Outputs

---

## Author

Shyam Sundar K N

Cloud & DevOps Engineer
AWS | Terraform | Docker | Kubernetes | Jenkins
