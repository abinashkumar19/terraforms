provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-084a7d336e816906b"
  instance_type = "t2.micro"

  tags = {
    Name = "abibyterraform"
  }
}
resource "aws_iam_role" "ec2_role" {
  name = "ec2_instance_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "example_with_iam" {
  ami           = "ami-084a7d336e816906b"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "abibyterraform-with-iam"
  }
}



resource "aws_instance" "example_with_iam_attached" {
  ami           = "ami-084a7d336e816906b"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "abibyterraform-iam-attached"
  }
}

# Alternatively, you can add the following line to the existing "aws_instance.example" block:
# iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

