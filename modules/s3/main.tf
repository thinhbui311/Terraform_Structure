resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = var.tag_name
    Environment = var.tag_env
  }
}
