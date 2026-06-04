variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "student_name" {
  description = "Student name in lowercase with hyphens"
  type        = string

  validation {
    condition     = can(regex("^[a-z-]+$", var.student_name))
    error_message = "Use lowercase letters and hyphens only, for example jan-kowalski."
  }
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Allowed values are dev and prod."
  }
}

variable "db_password" {
  description = "Password for the PostgreSQL master user"
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.db_password) >= 8
    error_message = "Database password must be at least 8 characters long."
  }
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH access to EC2"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_public_ip" {
  description = "Whether the EC2 instance gets a public IP"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}
