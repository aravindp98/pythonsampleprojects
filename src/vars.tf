variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "zone2" {
  default = "us-east-1b"
}

variable "usr" {
  default = "ec2-user"
}

variable "ec2-amis" {
  type = map(any)
  default = {
    us-east-1 = "ami-0e731c8a588258d0d"
  }
}

