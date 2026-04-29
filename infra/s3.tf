######## BACKEND #######
resource "aws_s3_bucket" "feedback_pdf_s3" {
  bucket = var.feedback_pdf_s3_name
}
resource "aws_s3_bucket_public_access_block" "feedback_pdf_s3_public_access" {
  bucket                  = aws_s3_bucket.feedback_pdf_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

####### APP ######
resource "aws_s3_bucket" "feedback_ui_app_s3" {
  bucket = var.feedback_ui_app_s3_name
}
resource "aws_s3_bucket_public_access_block" "feedback_ui_app_s3_public_access" {
  bucket                  = aws_s3_bucket.feedback_ui_app_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_website_configuration" "feedback_ui_app_s3_website" {
  bucket = aws_s3_bucket.feedback_ui_app_s3.id
  index_document {
    suffix = var.feedback_app_index
  }
}
resource "aws_s3_object" "frontend_index" {
  bucket       = aws_s3_bucket.feedback_ui_app_s3.id
  key          = var.feedback_app_index
  content_type = "text/html"
  content = templatefile("${path.module}/../app/frontend/index.html", {
    feedback_api_url = "https://${aws_api_gateway_rest_api.feedback_rest_api.id}.execute-api.${var.region_main}.amazonaws.com/${var.feedback_api_stage}/${var.feedback_api_path}"
  })
  etag = filemd5("${path.module}/../app/frontend/index.html")
}
