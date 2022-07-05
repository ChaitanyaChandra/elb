data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-nonprod-state-chaitu-env"
    key    = "vpc/${var.ENV}/alb/terraform.tfstate"
    region = "us-east-1"
  }
}

