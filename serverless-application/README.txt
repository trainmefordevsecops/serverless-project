## here we are creating the source code python logic for creating table, fetching table data queries etc. using various modules ##
## from the source code we are creating a zip and copying it to /infrastructure/lambda-project/lambda-db-query/files folder whenever there 
is change in logic of source code, python ##
## cmd to zip all the required python source code logic is given below ##
zip -r lambda psycopg2 lambda.py db_util.py boto3 botocore urllib3
