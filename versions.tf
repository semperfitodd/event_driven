provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Owner       = "Todd"
      Project     = "kinesis_poc"
      Provisioner = "Terraform"
    }
  }
}