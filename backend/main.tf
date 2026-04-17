
resource "aws_s3_bucket" "backend-module_bucket" {
  bucket = "backend-module-bucket-mod-project-apr2026"

  tags = {
    Name        = "backend-module-bucker-mod-project-apr2026"
  }
}

resource "aws_dynamodb_table" "State_lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"   
    }
}