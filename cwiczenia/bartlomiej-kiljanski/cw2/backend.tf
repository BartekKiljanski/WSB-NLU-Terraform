terraform {
  backend "s3" {
    bucket       = "wsb-nlu-terraform-state"
    key          = "students/bartlomiej-kiljanski/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}