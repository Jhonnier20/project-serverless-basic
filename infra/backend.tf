terraform {
  backend "s3" {
    bucket         = var.name_terraform_state_bucket_s3
    key            = "terraform.tfstate"
    region         = var.region_main
    dynamodb_table = var.state_dynamodb_table["name"]
  }
}
