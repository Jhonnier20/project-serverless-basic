resource "aws_lambda_function" "submit_feedback_function" {
  function_name = var.submit_feedback_function_name
  runtime       = var.runtime_function
  role          = aws_iam_role.feedback_function_role.arn
  handler       = var.submit_feedback_function_handler
  filename      = data.archive_file.submit_feedback_zip.output_path
  code_sha256   = data.archive_file.submit_feedback_zip.output_base64sha256


  environment {
    variables = {
      TABLE_NAME  = var.feedback_table_name
      BUCKET_NAME = var.feedback_pdf_s3_name
      ADMIN_EMAIL = var.admin_email
      REGION      = var.region_main
    }
  }
}

# Package the Lambda function code
data "archive_file" "submit_feedback_zip" {
  type        = "zip"
  source_file = "${path.module}/../app/backend/submit_feedback.py"
  output_path = "${path.module}/../app/backend/submit_feedback.zip"
}
