variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "eu-central-1"
}

variable "student_name" {
  description = "Imie i nazwisko (bez polskich znakow, z myslnikiem)"
  type        = string

  validation {
    condition     = can(regex("^[a-z-]+$", var.student_name))
    error_message = "Tylko male litery i myslniki. Np: jan-kowalski"
  }
}
variable "allowed_environments" {
  description = "Dozwolone srodowiska"
  type        = list(string)
  default     = ["dev", "staging", "prod"]
}

variable "environment" {
  description = "Srodowisko"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(var.allowed_environments, var.environment)
    error_message = "Dozwolone: dev, staging, prod."
  }
}

variable "enable_versioning" {
  description = "Czy wlaczyc wersjonowanie bucketu S3"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Dodatkowe tagi dla zasobow"
  type        = map(string)
  default     = {}
}

