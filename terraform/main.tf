terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region =  "us-east-1"
}

variable "ami_id" {
  type = string
  default = "ami-0f3c7d07486cad139"
}



resource "aws_instance" "ansible" {
  ami = var.ami_id
  instance_type =  "t2.micro"
  vpc_security_group_ids = [ "sg-06dec02f26eb25d04" ]
  tags = {
    Name = "Control Machine"
  }
}

resource "aws_instance" "nginx" {
  ami = var.ami_id
  instance_type =  "t2.micro"
  vpc_security_group_ids = [ "sg-06dec02f26eb25d04" ]
  tags = {
    Name = "nginx"
  }
}