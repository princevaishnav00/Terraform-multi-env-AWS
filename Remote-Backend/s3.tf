resource "aws_s3_bucket" "remote_s3" {
  bucket = "backend-remote-bucket-12345"
  force_destroy  = true

  tags = {
    Name   = "backend-remote-bucket-12345"
  }
}