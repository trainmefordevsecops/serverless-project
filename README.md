# serverless-project
infrastructure = containes all setup of vpc, subnet, routetable , ig, nat gateway, iam , role ecs, rds etc
container-application = build to get docker container calculating factorial
serverless-application = builds lambda to trigger on csv file upload and fetch data from csv file and update to rds table

## Steps to get started ##

-1) create the respective bucket for storing terraform state, lambda storage of csv file etc.
0) create aws creds file and store cres locally at ~/.aws/config or simple run aws configure cmd which will automatically store it.
1) create the container ecr repo , check for instructions from container-application directory. execute and create the docker image and post to ecr aws repo
2) initialize and create the infrastructure from infrastructure directory (ecs + fargate will be taken care and you will get the output of alb for executing the factorial )
3) now go to serverless-application directory and create the source code logic for db using python and create the bundle i.e zip file
4) copy the zip file from serverless-application folder to infrastructure/lambda-project/lambda-db-query/files/
5) execute the terraform init, plan, execute
6) create a csv file similar to serverless-project/serverless-application/lambda-db-query-src/test.csv and upload the file to s3 , once uploaded lambda will self trigger and store it to posgresql db
