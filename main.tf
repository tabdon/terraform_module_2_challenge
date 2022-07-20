terraform {
  required_version = ">= 0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "skillmix-lab"
}

# defining out networking module
module "networking" {
  source    = "./modules/networking"
}

# creating an ec2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0cf6f5c8a62fa5da6"
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.networking.security_group.id]
  subnet_id              = module.networking.subnet.id

  tags = {
    Name = "skillmix-lab-instance"
  }
}