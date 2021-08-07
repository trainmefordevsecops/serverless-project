resource "aws_security_group" "db" {
  name_prefix = "${var.env}-${var.project}-db"
  description = "${var.project} DB Security Group"
  vpc_id      = "${var.vpc}"


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
           name     = "db"
         }

}

#------------------------------------------------------------------------------
#   Subnet Groups
#------------------------------------------------------------------------------

#resource "aws_db_subnet_group" "main" {
#  name_prefix       = "${var.env}-${var.project}"
#  subnet_ids = "${var.dbsubnet}"
#
#}


resource "aws_db_instance" "postgresdb" {
  allocated_storage          =  "${var.storage}" 
  #max_allocated_storage      = "${var.max_allocated_storage}"
  storage_type               = "${var.type}"
  engine                     = "${var.dbengine}"
  engine_version             = "${var.dbengine_ver}"
  instance_class             = "${var.instance_type}"
  name                       = "${var.dbname}"
  username                   = "${var.username}"
  password                   = "${var.password}"
  #db_subnet_group_name       = "${aws_db_subnet_group.main.id}"
  db_subnet_group_name       = "${aws_db_subnet_group.main[0].id}"
  parameter_group_name       = "${var.db_parameter_group_name}"
  port                                         = "${var.port}"
  identifier                         = "${var.env}-${var.project}"
  multi_az                                   = "${var.multi_az}"
  backup_retention_period    = "${var.backup_retention_period}"
  vpc_security_group_ids       = [ "${aws_security_group.db.id}" ]

  tags = {
    Name                     = "${var.env}-${var.project}"
    Environment              = "${var.env}"
    Application              = "${var.project}"
  }

}

resource "aws_db_subnet_group" "main" {
  count = "${var.create ? 1 : 0}"

  name_prefix = "${var.env}-${var.project}"
  description = "Database subnet group "
  subnet_ids  = flatten(["${var.subnet_ids}"])

  tags = {
    name = "dbsubnet"
  }


  #tags = "${merge(var.tags, map("Name", format("%s", var.identifier)))}"
}

