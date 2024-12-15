resource "aws_db_instance" "rds_postgresql" {
  identifier              = "rds-postgresql"
  allocated_storage       = 20
  max_allocated_storage   = 25
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = "db.t3.micro"
  username                = jsondecode(aws_secretsmanager_secret_version.example.secret_string)["db-username"]
  password                = jsondecode(aws_secretsmanager_secret_version.example.secret_string)["db-password"]
  parameter_group_name    = "default.postgres16"
  skip_final_snapshot     = true
  publicly_accessible     = true
  backup_retention_period = 7
  db_name                 = var.db_name



  tags = {
    Name        = "fiap-tech-challenge-db-infra"
    Repository  = "https://github.com/rafabernardo/fiap-tech-challenge-db-infra"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }

}



resource "random_password" "example" {
  length           = 16
  special          = true
  override_special = "_%!"
}
resource "aws_secretsmanager_secret" "example" {
  name = "database-secrets-1"
}
resource "aws_secretsmanager_secret_version" "example" {
  secret_id = aws_secretsmanager_secret.example.id
  secret_string = jsonencode({
    db-username = var.db_username
    db-password = random_password.example.result
  })
}

output "db-name" {
  value = aws_db_instance.rds_postgresql.db_name
}

output "url" {
  value = aws_db_instance.rds_postgresql.endpoint
}

