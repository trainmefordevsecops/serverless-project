## terraform-fargate-example is built using terraform13 ##
## lambda is built using terraform 12 ##

terraform-fargate-example : creates all base infra vpc, subnet, route table, nat gateway, ig, iam role etc.

## cmd for initializing infra of terraform-fargate-example##
terraform13 init
terraform13 plan
terraform13 apply
############################################################

## cmd for initializing infra of lambda ##
terraform12 init
terraform12 plan
terraform12 apply
###########################################################



why :

ECS with AWS Fargate 
In this variant, you don’t need to worry about EC2 instances or servers anymore. Just choose the CPU and memory combo you need and your containers will be deployed there. 

Pros:
No servers to manage.
AWS is in charge of container availability and scalability. Still, better select the right CPU and memory – otherwise, you risk that your application becomes unavailable.


lambda project:
creates lambda, role, sg, policy, s3 upload trigger of csv, cloudwatch for accessing query logs, rds separate folder to create postgresql

 
