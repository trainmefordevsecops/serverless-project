resource "aws_iam_role" "lambda_role" {
  name = "${var.env}-${var.project}-${var.lambda_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "lambda_iam_policy_doc" {

  statement {
    actions = [
               	"ec2:DetachNetworkInterface",
               	"ec2:DescribeNetworkInterfaces",
               	"ec2:DeleteNetworkInterface",
             	"ec2:CreateNetworkInterface"
            ]

    resources = [
      "*",
    ]
  }    
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:GetLogEvents",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
      "logs:DescribeLogStreams"
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.function_name}",
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.function_name}:*"
    ]
  }


 statement {
            actions = [
                "rds:*",
                "s3:GetObject",
                "s3:ListBucket", 
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeVpcs"
            ]
            resources =  ["*",]
        } 

}
resource "aws_iam_policy" "lambda_iam_policy" {
  name_prefix = "${var.env}-${var.project}-${var.lambda_name}-"
  path        = "/"
  description = "${var.env} ${var.project} ${var.lambda_name} iam policy"
  policy      = "${data.aws_iam_policy_document.lambda_iam_policy_doc.json}"
}


resource "aws_iam_role_policy_attachment" "lambda_attach" {
    role       = "${aws_iam_role.lambda_role.name}"
    policy_arn = "${aws_iam_policy.lambda_iam_policy.arn}"
}

