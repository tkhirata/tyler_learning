terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "test" {
  ami           = "ami-04158184f60ea8b5e"
  instance_type = "t2.micro"

  tags = {
    Name = "TestInstance"
  }
}