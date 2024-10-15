instance.tf #to make multiple instance
provider "aws" {
  region = "ap-southeast-1"
}

variable "instance_type" {
  description = "value"
}

variable "ami" {
  description = "value"
}


resource "aws_instance" "example" {
  count = "5"
  instance_type = var.instance_type
  ami = var.ami
}



