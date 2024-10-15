vpc.tf # creation of vpc and create the instance in that vpc 

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "vpc1" {
  cidr_block = 10.0.0.0/16
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "ap-southeast-1a"
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
  
  route {
    cidr_block = 0.0.0.0/0
    gateway_id = aws_internet_gateway.igw1
  }
}

resource "aws_route_table_association" "rt-associate" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_instance" "instance1" {
  ami = "ami-047126e50991d067b"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub1.id  
}
