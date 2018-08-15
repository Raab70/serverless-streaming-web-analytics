provider "aws" {
    version = "~> 1.30"
    region  = "us-east-1"
    profile = "personal"
}

terraform {
  required_version = ">= 0.11.7, < 0.12"

  backend "s3" {
    bucket         = "rharrigan-terraform-state"
    key            = "unsupervisedpandas/default.tfstate"
    region         = "us-east-1"
    acl            = "private"
    profile        = "personal"
  }
}