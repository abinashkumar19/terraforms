variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-020cba7c55df1f615" # Ubuntu 18.04 in us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}

