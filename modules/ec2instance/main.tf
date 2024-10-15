provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami = var.ami
  availability_zone = var.availability_zone
}
