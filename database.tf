# THE DATABASE (DynamoDB for visitor count)
resource "aws_dynamodb_table" "visitor_count" {
  name         = "VisitorCount"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}