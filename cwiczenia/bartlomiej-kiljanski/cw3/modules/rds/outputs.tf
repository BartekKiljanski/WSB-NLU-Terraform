output "db_instance_id" {
  description = "RDS instance identifier"
  value       = aws_db_instance.main.id
}

output "endpoint" {
  description = "Connection endpoint for the PostgreSQL instance"
  value       = aws_db_instance.main.endpoint
}

output "address" {
  description = "DNS address of the PostgreSQL instance"
  value       = aws_db_instance.main.address
}

output "security_group_id" {
  description = "Security group ID attached to the RDS instance"
  value       = aws_security_group.main.id
}
