# Outputs for RDS connection details
output "rds_hostname" {
  description = "RDS instance hostname"
  value       = module.db.db_instance_address
}

output "rds_port" {
  description = "RDS instance port"
  value       = module.db.db_instance_port
}

output "rds_database_name" {
  description = "The database name"
  value       = module.db.db_instance_name
}
