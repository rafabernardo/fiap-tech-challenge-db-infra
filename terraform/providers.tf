terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = ">= 3.0"
  }

  backend "s3" {
    bucket = "fiap-tech-challenge-terraform"
    key    = "fiap-tech-challenge-terraform-db/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}
