# S3 Bucket 


resource "aws_s3_bucket" "my_s3" {
  bucket = "${var.Env}-infra-project-bucket"
  force_destroy  = true

  tags = {
    Name   = "${var.Env}-infra-project-bucket"
    Environment = var.Env
  }
}