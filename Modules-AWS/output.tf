output "ec2_ip" {
  value = aws_instance.my-ec2[*].public_ip
  description = "Public IP addresses of the EC2 instances"
}

output "s3_bucket_id" {
  value = aws_s3_bucket.my_s3.id
  description = "ID of the S3 bucket"
}

