
# Multi environment by using module

module "Dev-app" {
  source            = "./aws-infra"
  Env               = "dev"
  ami_id            = "ami-05d2d839d4f73aafb" # Ubuntu Image
  Instance_type     = "t3.micro"
  Instance_count    = 1
  availability_zone = "ap-south-1a"
}

module "Prod-app" {
  source            = "./aws-infra"
  Env               = "prod"
  ami_id            = "ami-05d2d839d4f73aafb" # Ubuntu Image
  Instance_type     = "t3.micro"
  Instance_count    = 2
  availability_zone = "ap-south-1a"
}


module "Stage-app" {
  source            = "./aws-infra"
  Env               = "stage"
  ami_id            = "ami-05d2d839d4f73aafb" # Ubuntu Image
  Instance_type     = "t3.micro"
  Instance_count    = 3
  availability_zone = "ap-south-1a"
}
