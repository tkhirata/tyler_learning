terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "ConfigurableWebserver" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
            #!/bin/bash
            echo "hi"
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p ${var.server_port} &
            EOF

  user_data_replace_on_change = true


  tags = {
    Name = "ConfigurableWebserver"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-ConfigurableWebserver-example-instance"

  ingress{
    from_port = var.server_port
    to_port   = var.server_port
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}