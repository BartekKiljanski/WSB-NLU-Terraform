terraform {
  backend "s3" {
    bucket         = "wsb-nlu-terraform-state"
    key          = "students/JAN-KOWALSKI/terraform.tfstate"  # ZMIEŃ: wpisz swoje imię-nazwisko
    region         = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}
