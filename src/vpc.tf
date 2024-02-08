resource "aws_vpc" "devOps_project" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devOps_project"
  }
}

resource "aws_subnet" "PrivateA" {
  vpc_id = aws_vpc.devOps_project.id
  cidr_block = "10.0.0.1/20"
  availability_zone = var.zone1
}

resource "aws_subnet" "PrivateB" {
  vpc_id = aws_vpc.devOps_project.id
  cidr_block = "10.0.16.0/20"
  availability_zone = var.zone2
}

resource "aws_subnet" "PublicA" {
  vpc_id = aws_vpc.devOps_project.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.zone1
}

resource "aws_subnet" "PublicB" {
  vpc_id = aws_vpc.devOps_project.id
  cidr_block = "10.0.23.0/24"
  availability_zone = var.zone2
}