#------------------------------------------------------------------------------
#   Security Group
#------------------------------------------------------------------------------

resource "aws_security_group" "lambda-sg" {
  name_prefix = "${var.env}-${var.project}-${var.lambda_name}-sg-"
  description = "${var.env} ${var.project} Lambda security group for ${var.lambda_name}"
  vpc_id      = "${var.vpc}"

  tags = {
    Name          = "${var.env}-${var.project}-${var.lambda_name}-sg"
    Environment   = "${var.env}"
    Application   = "${var.project}"
    Role          = "${var.project}-lambda"
  }

  egress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "rds" {
count = "${var.rds_required == "true" ? 1 : 0}"
  security_group_id         = "${data.aws_security_group.rds[0].id}"
  type                      = "ingress"
  from_port                 = 5432
  to_port                   = 5432
  protocol                  = "tcp"
  source_security_group_id  = "${aws_security_group.lambda-sg.id}"
}
