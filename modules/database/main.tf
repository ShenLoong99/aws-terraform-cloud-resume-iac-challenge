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

# SECURITY: Grant only the permissions needed for this specific table
resource "aws_iam_role_policy" "lambda_db_policy" {
  name = "LambdaDynamoDBAccess"
  role = var.lambda_role_id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["dynamodb:UpdateItem", "dynamodb:GetItem"]
      Effect   = "Allow"
      Resource = aws_dynamodb_table.visitor_count.arn
    }]
  })
}
