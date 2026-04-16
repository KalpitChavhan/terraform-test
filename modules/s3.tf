resource "aws_s3_bucket" "bucket-mod" {
  bucket = "${var.env}-bucket-mod"

  tags = {
    Name        = "${var.env}-bucket-mod"
    Environment = var.env
  }
}
