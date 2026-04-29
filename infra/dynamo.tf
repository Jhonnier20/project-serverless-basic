resource "aws_dynamodb_table" "feedback_table" {
  name         = var.feedback_table_name
  billing_mode = var.billing_mode_feedback_table
  hash_key     = var.hash_key_feedback_table

  attribute {
    name = var.hash_key_feedback_table
    type = "S"
  }
}
