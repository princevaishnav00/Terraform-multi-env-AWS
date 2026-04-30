resource "aws_dynamodb_table" "remote_table" {
  name           = "${var.Env}-project-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Lock_ID"

  attribute {
    name = "Lock_ID"
    type = "S"
  }

  tags = {
    Name        = "${var.Env}-project-table"
    Environment = var.Env
}
}