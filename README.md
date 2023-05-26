# serverless-project
infrastructure = containes all setup of vpc, subnet, routetable , ig, nat gateway, iam , role ecs, rds etc
container-application = build to get docker container calculating factorial
serverless-application = builds lambda to trigger on csv file upload and fetch data from csv file and update to rds table

## Steps to get started ##

-1) create the respective bucket for storing terraform state, lambda storage of csv file etc.

0) create aws creds file and store cres locally at ~/.aws/config or simple run aws configure cmd which will automatically store it.

2) create the container ecr repo , check for instructions from container-application directory. execute and create the docker image and post to ecr aws repo
3) initialize and create the infrastructure from infrastructure directory (ecs + fargate will be taken care and you will get the output of alb for executing the factorial )
4) now go to serverless-application directory and create the source code logic for db using python and create the bundle i.e zip file
5) copy the zip file from serverless-application folder to infrastructure/lambda-project/lambda-db-query/files/
6) execute the terraform init, plan, execute
7) create a csv file similar to serverless-project/serverless-application/lambda-db-query-src/test.csv and upload the file to s3 , once uploaded lambda will self trigger and store it to posgresql db


my udemy courses links:

### reachout to me for available discounts if any for the month ###

#Jenkins #ci #cd https://www.udemy.com/course/jenkins-zero-to-pro/?referralCode=

#DevSecOps #DevOps https://www.udemy.com/course/devsecops/?referralCode=7A73B2D1AD95E1F68C1F

#docker #container #docker-compose #k8s https://www.udemy.com/course/docker-devops/?referralCode=ECEDBD3CEC6B99717566

#SonarQube #infosec #security #sast #devops #devsecops https://www.udemy.com/course/sonarqube-master-sonarqube-within-a-few-hours-2020/?referralCode=992044CBD2B0CAA48856

#google #cloud #serverless #devops #devsecops #computing https://www.udemy.com/course/google-cloud-serverless

#devops #certification #aws #DOP-C01 #certification https://www.udemy.com/course/aws-devops-practice-test/?referralCode=D8209AD57D310A001C78
