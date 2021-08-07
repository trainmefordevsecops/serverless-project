terraform {
  backend "s3" {

    key             = "dbquery/infra/lambda/terraform.state"
    profile         = "default"
    region          = "ap-south-1"
    bucket          = "db-state"
  }
}
