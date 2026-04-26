terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.43.0"
    }
  }
  required_version = "~>1.13.3"
}

provider "aws" {
  region = var.region_main
  alias  = "virginia"
}
