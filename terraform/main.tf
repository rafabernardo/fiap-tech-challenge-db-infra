resource "aws_db_instance" "rds_postgresql" {
  identifier              = "rds-postgresql"
  allocated_storage       = 20
  max_allocated_storage   = 25
  engine                  = "postgres"
  engine_version          = "16.3"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = "default.postgres16"
  skip_final_snapshot     = true
  publicly_accessible     = true
  backup_retention_period = 7
  db_name                 = var.db_name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name


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


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.subnets.ids

  tags = {
    Name = "rds-subnet-group"
  }
}
