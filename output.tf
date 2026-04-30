output "dev_ec2_ips" {
  value = module.Dev-app.ec2_ip
}

output "prod_ec2_ips" {
  value = module.Prod-app.ec2_ip
}

output "stage_ec2_ips" {
  value = module.Stage-app.ec2_ip
}

output "dev_s3_bucket" {
  value = module.Dev-app.s3_bucket_id
}

output "prod_s3_bucket" {
  value = module.Prod-app.s3_bucket_id
}

output "stage_s3_bucket" {
  value = module.Stage-app.s3_bucket_id
}