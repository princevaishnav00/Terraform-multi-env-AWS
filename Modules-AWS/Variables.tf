# EC2 instance variables

variable "Env" {
  description = "This  environment for infrastructure (e.g., dev, staging, prod)"
  type = string
}


variable "ami_id" {
  description = "This variable is AMI ID for the EC2 instance"
  type = string
}


variable "Instance_type" {
  description = " This is Instance type for the EC2 instance"
  type = string
}

variable "Instance_count" {
    description = "Number of EC2 instances to create"
    type        = number
  
}


variable "availability_zone" {
  description = "This is Availability Zone for the EC2 instance"
  type = string
}


