output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "ec2_url" {
  description = "HTTP URL of the EC2 instance"
  value       = module.ec2.public_ip != null ? "http://${module.ec2.public_ip}" : null
}

output "rds_endpoint" {
  description = "PostgreSQL endpoint"
  value       = module.rds.endpoint
}

output "rds_address" {
  description = "PostgreSQL DNS address"
  value       = module.rds.address
}
