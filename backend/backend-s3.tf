
resource "aws_s3_bucket" "backend-module_bucket" {
  bucket = "backend-module-bucket-mod-project-apr2026"

  tags = {
    Name        = "backend-module-bucker-mod-project-apr2026"
    Environment = "dev"
  }
}