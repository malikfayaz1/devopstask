terraform {
  required_version = ">= 0.15"
}

provider "aws" {
  profile = var.aws_profile
  region = var.aws_region
}