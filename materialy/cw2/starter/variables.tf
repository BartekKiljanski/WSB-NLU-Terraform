variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "eu-central-1"
}

variable "student_name" {
  description = "Imię i nazwisko (bez polskich znaków, z myślnikiem)"
  type        = string

  validation {
    condition     = can(regex("^[a-z-]+$", var.student_name))
    error_message = "Tylko małe litery i myślniki. Np: jan-kowalski"
  }
}

variable "environment" {
  description = "Środowisko"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Dozwolone: dev, staging, prod."
  }
}

variable "enable_versioning" {
  description = "Czy włączyć wersjonowanie bucketu S3"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Dodatkowe tagi dla zasobów"
  type        = map(string)
  default     = {}
}
