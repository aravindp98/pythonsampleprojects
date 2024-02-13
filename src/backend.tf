terraform {
  backend "s3" {
    bucket = "terrafor-scpts"
    key    = "terrafor-scpts/terraform-state-siles"
    region = "us-east-1"
  }
}