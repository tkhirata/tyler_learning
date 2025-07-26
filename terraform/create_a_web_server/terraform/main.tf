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

resource "aws_instance" "WebServer" {
  ami           = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
            #!/bin/bash
            echo "hi"
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p 8080 &
            EOF

  user_data_replace_on_change = true


  tags = {
    Name = "Web Server"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-webserver-example-instance"

  ingress{
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}