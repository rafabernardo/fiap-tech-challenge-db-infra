## Description

This repository contains a Terraform configuration for deploying an AWS RDS PostgreSQL instance. It serves as a component of a technical assessment for the postgraduate Software Architecture project.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.10.0
- AWS account with appropriate permissions
- GitHub repository secrets configured for AWS credentials and other sensitive data

## Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
   ```

2. **Initialize Terraform:**

   ```sh
   cd terraform
   terraform init
   ```

3. **Create a `terraform.tfvars` file with your variables:**

   ```sh
   cat <<EOF > terraform.tfvars
   aws_region = "us-east-1"
   db_username = "your_db_username"
   db_password = "your_db_password"
   db_name = "your_db_name"
   EOF
   ```

4. **Plan the infrastructure:**

   ```sh
   terraform plan
   ```

5. **Apply the infrastructure changes:**
   ```sh
   terraform apply
   ```

## GitHub Actions

This repository uses GitHub Actions to automate Terraform workflows. The pipeline is defined in [`.github/workflows/pipeline.yml`](.github/workflows/pipeline.yml).

### GitHub Secrets

- `AWS_ACCESS_KEY_ID`: AWS access key ID
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key
- `AWS_REGION`: AWS region
- `AWS_SESSION_TOKEN`: AWS session token (mandatory for AWS Academy accounts)
- `BUCKET_TF_STATE`: S3 bucket for storing Terraform state

### How to create S3 bucket for Terraform state

Check this repository [s3-backend-state](https://github.com/rafabernardo/fiap-tech-challenge-s3-backend-state) for creating an S3 bucket (steps) for storing Terraform state.

### Workflow Steps

- **Checkout code**
- **Setup Terraform**
- **Configure AWS credentials**
- **Terraform Init**
- **Terraform Validate**
- **Terraform Plan**
- **Terraform Apply** (only on push to `main` branch)

## Variables

The following variables are defined in [variables.tf](terraform/variables.tf):

- `aws_region`: AWS region to deploy resources
- `db_username`: Username for the RDS instance
- `db_password`: Password for the RDS instance
- `db_name`: Name of the database

## Resources

The following resources are defined in [main.tf](terraform/main.tf):

- `aws_db_instance.rds_postgresql`: AWS RDS PostgreSQL instance
