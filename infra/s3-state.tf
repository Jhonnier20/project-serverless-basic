resource "aws_s3_bucket" "terraform_state_s3" {
  bucket = var.name_terraform_state_bucket_s3
  tags   = var.tags_terraform_state_s3

}

resource "aws_s3_bucket_versioning" "terraform_state_s3_versioning" {
  bucket = aws_s3_bucket.terraform_state_s3.id
  versioning_configuration {
    status = var.status_versioning_s3
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_s3_public_access_block" {
  bucket                  = aws_s3_bucket.terraform_state_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
