resource "aws_instance" "lol-leaderboard-webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.lol-leaderboard-sg.id]

  user_data = <<-EOF
            #!/bin/bash
            sudo apt update -y
            sudo apt install apache2 -y
            sudo systemctl start apache2
            echo "Deploy a web server on aws" | sudo tee /var/www/html/index.html
            sudo systemctl status apache2

            mkdir /tmp/ssm
            cd /tmp/ssm
            wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
            sudo dpkg -i amazon-ssm-agent.deb
            sudo systemctl status amazon-ssm-agent
            sudo systemctl enable amazon-ssm-agent
            EOF

  user_data_replace_on_change = true


  tags = {
    Name = "lol leaderboard"
  }
}

data "aws_security_group" "lol-leaderboard-sg"{
  filter{
    name = "group-name"
    values = ["lol-leaderboard-sg"]
  }
}


