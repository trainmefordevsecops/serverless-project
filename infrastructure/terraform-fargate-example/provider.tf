provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "terraform-fargate-mum"
    key    = "terraform-fargate.tfstate"
    region = "ap-south-1"
  }
}
