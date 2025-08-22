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

module "ec2"{
  source = "./modules/ec2"
}

module "SecurityGroups" {
  source = "./modules/security_groups"
}

module "SecretManager" {
  source = "./modules/secret-management"
}