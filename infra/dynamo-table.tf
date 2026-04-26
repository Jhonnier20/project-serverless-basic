resource "aws_dynamodb_table" "serverless_table_state" {
  name     = var.state_dynamodb_table["name"]
  hash_key = var.state_dynamodb_table["hash_key"]
  tags     = var.tags_state_dynamodb

  attribute {
    name = var.state_dynamodb_table["hash_key"]
    type = "S"
  }
}
