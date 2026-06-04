variable "vpc_id" {
  description = "VPC ID for the RDS resources"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs used by the DB subnet group"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "Security group ID of the EC2 instance allowed to connect"
  type        = string
}

variable "db_password" {
  description = "Password for the PostgreSQL master user"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "multi_az" {
  description = "Whether the RDS instance should run in Multi-AZ mode"
  type        = bool
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled on the RDS instance"
  type        = bool
}

variable "backup_retention_period" {
  description = "Number of days to keep backups"
  type        = number
}

variable "name_prefix" {
  description = "Common prefix for resource names"
  type        = string
}

variable "tags" {
  description = "Additional tags for RDS resources"
  type        = map(string)
  default     = {}
}
