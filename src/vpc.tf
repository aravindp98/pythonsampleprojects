resource "aws_vpc" "devOps_project" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devOps_project"
  }
}