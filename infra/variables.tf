variable "region_main" {
  description = "Region  main for project"
  type        = string
}

#################### BACKEND ####################
variable "name_terraform_state_bucket_s3" {
  description = "Name for Bucket"
  type        = string
}
variable "tags_terraform_state_s3" {
  description = "Tags del s3 state"
  type        = map(string)
}
variable "status_versioning_s3" {
  description = "Habiltar el versionamiento en el S3"
  type        = string
}
variable "state_dynamodb_table" {
  description = "Information for DynamoDB"
  type        = map(string)
}
variable "tags_state_dynamodb" {
  description = "Tags del dynamodb state"
  type        = map(string)
}
variable "billing_mode_state_dynamodb" {
  description = "Billing mode del dynamodb state"
  type        = string
}

###################################################
