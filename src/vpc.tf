resource "aws_vpc" "devOps_project" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devOps_project"
  }
}

resource "aws_subnet" "PrivateA" {
  vpc_id            = aws_vpc.devOps_project.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = var.zone1
  tags = {
    Name = "PrivateA"
  }
}

resource "aws_subnet" "PrivateB" {
  vpc_id            = aws_vpc.devOps_project.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = var.zone2
  tags = {
    Name = "PrivateB"
  }
}

resource "aws_subnet" "PublicA" {
  vpc_id            = aws_vpc.devOps_project.id
  cidr_block        = "10.0.32.0/24"
  availability_zone = var.zone1
  tags = {
    Name = "PublicA"
  }
}

resource "aws_subnet" "PublicB" {
  vpc_id            = aws_vpc.devOps_project.id
  cidr_block        = "10.0.33.0/24"
  availability_zone = var.zone2
  tags = {
    Name = "PublicB"
  }
}

resource "aws_internet_gateway" "devops-ig" {
  vpc_id = aws_vpc.devOps_project.id
  tags = {
    Name = "devops-ig"
  }
}

resource "aws_route_table" "Public-rt" {
  vpc_id = aws_vpc.devOps_project.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops-ig.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public-ass" {
  count          = 2
  route_table_id = aws_route_table.Public-rt.id
  subnet_id      = count.index == 0 ? aws_subnet.PublicA.id : aws_subnet.PublicB.id
}

resource "aws_route_table" "Private-rt" {
  vpc_id = aws_vpc.devOps_project.id
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private-ass" {
  count          = 2
  route_table_id = aws_route_table.Private-rt.id
  subnet_id      = count.index == 0 ? aws_subnet.PrivateA.id : aws_subnet.PrivateB.id
}