variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "db_username" {
  description = "Database master username"
  sensitive   = true
}

variable "db_password" {
  description = "Database master password"
  sensitive   = true
}

variable "db_name" {
  description = "Name of the database"
}

variable "project_name" {
  description = "Database fiap tech challenge"
}

variable "environment" {
  description = "Environment for the resources"
  default     = "production"
}


