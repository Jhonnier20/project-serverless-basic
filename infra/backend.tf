terraform {
  backend "s3" {
    bucket         = "serverless-basic-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "serverless-table-state"
  }
}
