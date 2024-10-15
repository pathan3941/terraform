provider "aws" {
  region = "ap-southeast-1"
}


module "ec2_instance" {
  source = "./modules/ec2instance"
  instance_type = "t2.micro"
  ami = "ami-047126e50991d067b"
  availability_zone = "ap-southeast-1a"
}
