##################
# Adding S3 bucket as trigger to my lambda and giving the permissions
##################
resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
bucket = "${var.bucket}"
lambda_function {
lambda_function_arn = "${aws_lambda_function.lambda_function.arn}"
events              = ["s3:ObjectCreated:*"]
#filter_prefix       = "file-prefix"
#filter_suffix       = "file-extension"
}
}
resource "aws_lambda_permission" "test" {
statement_id  = "AllowS3Invoke"
action        = "lambda:InvokeFunction"
function_name = "${aws_lambda_function.lambda_function.function_name}"
principal = "s3.amazonaws.com"
source_arn = "arn:aws:s3:::${var.bucket}"
}




resource "aws_lambda_function" "lambda_function" {
  role          = "${aws_iam_role.lambda_role.arn}"
  handler          = "${var.handler}"
  runtime          = "${var.runtime}"
  filename         = "files/lambda.zip"
  function_name    = "${var.function_name}"
  memory_size      = "${var.memory_size}"
  timeout          = "${var.timeout}"
  source_code_hash = "${base64sha256(filemd5("files/lambda.zip"))}"

  environment {
    variables = {
    db_host = "${var.db_host}"
    db_user = "${var.db_user}"
    db_pass = "${var.db_pass}"
    db_port = "${var.db_port}"
    db_name = "${var.db_name}"
    #db_table = "${var.db_table}"
    db_query = "${var.db_query}"
    env = "${var.env}"
    bucket = "${var.bucket}"
   }

 }

  vpc_config {
    subnet_ids = data.aws_subnet.dbs.*.id
    security_group_ids = ["${aws_security_group.lambda-sg.id}"]
  }
  tags = {
    Name          = "${var.env}-${var.project}-${var.lambda_name}"
    Environment   = "${var.env}"
    Application   = "${var.project}"
    Role          = "dbquerylambda"
  }

}

