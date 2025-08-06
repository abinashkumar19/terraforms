terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-084a7d336e816906b"
  instance_type = "t2.micro"
  tags = {
    Name = "my-example-ec2-terraform"
  }
}
