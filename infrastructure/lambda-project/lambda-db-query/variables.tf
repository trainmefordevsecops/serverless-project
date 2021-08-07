
variable "function_name" {
 description = "name of the db query function"
  type        = "string"
  default = "query"
}

variable "handler" {
  default = "lambda.lambda_handler"
}

variable "runtime" {
  default = "python3.8"
}


variable "organisation" {
  description = "Name of your Organisation in AWS account"
  type        = "string"
  default = "manish"
}

variable "account" {
  description = "Name of your Organisation in AWS account"
  type        = "string"
  default = "my-account"
}

variable "grp" {
  description = "Name of your environment group to deploy eg UAT/PRD"
  type        = "string"
  default = "dev-grp"
}

variable "env" {
  description = "Deployment environment"
  type        = "string"
  default = "dev"
}

variable "project" {
  description = "Name of Project to be deployed"
  type        = "string"
  default = "my"
}


variable "lambda_name" {
  description = "name of lambda to be created"
  type = "string"
  default = "my-db-query"
}

variable "schedule" {
  description = "name of schedule to trigger lambda"
  type = "string"
  default = ""
}

variable "schedule_describe" {
  description = "Description of schedule that will trigger lambda"
  type = "string"
  default = ""
}

variable "schedule_expression" {
  description = "cron expression of lambda run"
  type = "string"
  default = ""
}

variable "memory_size" {
  description = "memory allotted for lambda"
  type = "string"
  default = "1024"
}

variable "timeout" {
  description = "timeout allotted for lambda"
  type = "string"
  default = "300"
}


variable "package_type" {
  description = "lambda package type"
  type = "string"
  default = "zip"
}


variable "rds_required" {
  description = "whether rds access is needed by lambda"
  type = "string"
  default = "true"
}

variable "rds_sg_name" {
  description = "tag name of security grpup attached to RDS"
  type = "string"
  default = ""
}

variable "bucket" {
  description = "name of bucket which will act as trigger for lambda"
  type = "string"
  default = "mydb-query"
}

variable "s3_bucket" {
  description = "name of bucket where lambda package is stored"
  type = "string"
  default = "mydb-query"
}


variable "db_host"  {
 type = "string"
 default = "dev-my.zzzzzz.ap-south-1.rds.amazonaws.com"
}
variable "db_user"  {
 type = "string"
 default = "myuser"
}
variable "db_pass"  {
 type = "string"
 default = "Mypassword"
}
variable "db_port"  {
 type = "string"
 default = "5432"
}
variable "db_name"  {
 type = "string"
 default = "myappdb"
}
#variable "db_query"   { default = "CREATE TABLE IF NOT EXISTS app_user (id integer NOT NULL DEFAULT '1',name varchar(40))"}
#variable "db_query" { default = "select * from app_user;"}
variable "db_query" { default = "insert into app_user(id,name)"}
variable "vpc"       { default = "zzzzz" }

variable "s3_resources" {
  description = "S3 resources to be used by application"
  type = "list"
  default = ["arn:aws:s3:::mydb-query","arn:aws:s3:::mydb-query/"]
}

