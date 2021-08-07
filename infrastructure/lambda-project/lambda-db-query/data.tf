data "aws_caller_identity" "current" {}


data "aws_region" "current" {
  name = "ap-south-1"
}


#data "aws_availability_zone" "zones" {
#  count = "2"
#  #name = "${data.aws_region.current.name}${lookup(var.suffixes, count.index)}"
#  name = "${data.aws_region.current.name}${lookup(count.index)}"
#}


#------------------------------------------------------------------------------
#   VPC and Subnets
#------------------------------------------------------------------------------

data "aws_vpc" "main" {
  tags = {
    name = "myvpc"
  }
}

data "aws_subnet" "dbs" {
  count  = 2
  vpc_id = "${ data.aws_vpc.main.id }"
  #availability_zone = "${ element( data.aws_availability_zone.zones.*.id, count.index ) }"
  availability_zone = "ap-south-1a"
  #availability_zone = "aps1-az1,aps1-az3"

  tags = {
    name = "privatesubnet"
  }
}


#------------------------------------------------------------------------------
#   Security Groups
#------------------------------------------------------------------------------

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.main.id}"
  tags = {
    name = "db"
  }
}

data "aws_security_group" "rds" {
count = "${var.rds_required == "true" ? 1 : 0}"
  vpc_id = "${data.aws_vpc.main.id}"
  tags = {
    name = "db"
  }
}

