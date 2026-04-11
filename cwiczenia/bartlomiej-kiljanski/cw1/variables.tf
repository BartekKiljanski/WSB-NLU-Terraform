variable "aws_region" {
 description = "Region AWS"
 type = string
 default = "eu-central-1"
}
variable "student_name" {
 description = "Twoje imie i nazwisko (bez polskich znakow, z myslnikiem)"
 type = string
}
variable "environment" {
 description = "Srodowisko: dev, staging lub prod"
 type = string
 default = "dev"
 validation {
 condition = contains(["dev", "staging", "prod"], var.environment)
 error_message = "Dozwolone wartosci: dev, staging, prod."
 }
}