terraform {
  backend "s3" {

    key             = "test/infra/db/terraform.state"
    profile         = "default"
    region          = "ap-south-1"
    bucket          = "db-state"
  }
}
