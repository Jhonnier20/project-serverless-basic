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

###################################################
