module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = "${var.project_name}-postgresql"

  # Database engine configuration
  engine               = "postgres"
  engine_version       = "15"
  family               = "postgres15"
  major_engine_version = "15"

  # Instance configuration
  allocated_storage = 10

  # Database credentials and basic settings
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  # Network configuration
  vpc_security_group_ids = [module.rds_sg.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.postgresql_subnet_group.name

  # Backup and maintenance windows
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 7

  # Deletion protection
  deletion_protection = false

  # Performance insights
  performance_insights_enabled = false

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Project     = var.project_name
  }
}


