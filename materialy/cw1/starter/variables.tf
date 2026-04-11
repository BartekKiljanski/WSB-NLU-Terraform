variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "eu-central-1"
}

variable "student_name" {
  description = "Twoje imię i nazwisko (bez polskich znaków, z myślnikiem, np. jan-kowalski)"
  type        = string
  # Uzupełnij w terraform.tfvars
}

variable "environment" {
  description = "Środowisko: dev, staging lub prod"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Dozwolone wartości: dev, staging, prod."
  }
}
