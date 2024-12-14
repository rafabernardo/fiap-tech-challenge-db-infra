variable "aws_region" {
  default = "us-east-1"
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "user_fiap"
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  default     = "password_fiap"
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "fiap_tech_challenge"
}

variable "vpcCidr" {
  default = "172.31.0.0/16"
}

variable "projectName" {
  default = "fiap-tech-challenge"
}

variable "regionDefault" {
  default = "us-east-1"
}
