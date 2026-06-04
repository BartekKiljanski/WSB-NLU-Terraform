variable "vpc_id" {
  description = "VPC ID for the EC2 resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "environment" {
  description = "Target environment name"
  type        = string
}

variable "student_name" {
  description = "Student name used in tags and user data"
  type        = string
}

variable "name_prefix" {
  description = "Common prefix for resource names"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed to connect over SSH"
  type        = string
}

variable "enable_public_ip" {
  description = "Whether the EC2 instance gets a public IP"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags for EC2 resources"
  type        = map(string)
  default     = {}
}
