## create repo ##
aws ecr create-repository --repository-name python-fact, if you havent created the repo using initial terraform infra 

## login to ecr repo of aws ##
$(aws ecr get-login --region ap-south-1 --no-include-email)

## build docker image##
 
 docker build -t python-fact .
 docker tag python-fact:latest aws_accoiunt_no.dkr.ecr.ap-south-1.amazonaws.com/python-fact:latest
 docker push aws_account_no.dkr.ecr.ap-south-1.amazonaws.com/python-fact:latest

