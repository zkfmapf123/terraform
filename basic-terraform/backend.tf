terraform {
  backend "s3" {
    bucket = "dkdk-terraform-state"
    key    = "terraform.tfstate"
  }
}