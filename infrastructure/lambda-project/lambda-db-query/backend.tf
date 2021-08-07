terraform {
  backend "s3" {

    key             = "dbquery/infra/lambda/terraform.state"
    profile         = "personal"
    region          = "ap-south-1"
    bucket          = "db-state"
  }
}
