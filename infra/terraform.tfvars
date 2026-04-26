region_main = "us-east-1"

name_terraform_state_bucket_s3 = "serverless-basic-terraform-state"
tags_terraform_state_s3 = {
  Name        = "My bucket for state Terraform"
  Environment = "Dev"
  Owner       = "Jhonnier"
}
status_versioning_s3 = "Enabled"
state_dynamodb_table = {
  "name"     = "serverless-table-state"
  "hash_key" = "lock_id"
}
tags_state_dynamodb = {
  Name        = "My DynamoDB for state Terraform"
  Environment = "Dev"
  Owner       = "Jhonnier"
}
billing_mode_state_dynamodb = "PAY_PER_REQUEST"
