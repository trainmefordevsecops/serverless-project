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


# DevSecOps Udemy Tutorial Repository

Welcome to the **DevSecOps** Udemy Tutorial repository!  
This repository contains resources and links to our Udemy courses, focusing on **DevSecOps** (a blend of DevOps + Security). Whether you're a **Freshers**, **DevOps Engineer**, **Application Support Specialist**, **QA Professional**, or in **Infosec**, these courses are designed for professionals at all levels.

## Course Overview:
We provide **professional-level training** in DevSecOps, covering tools and practices used in the industry to secure your applications and infrastructure while embracing DevOps practices.


---

## My Udemy Online Courses:

### 🚀 **DevSecOps**
- Learn the essentials of DevSecOps and how security integrates with the DevOps pipeline.  
[**DevSecOps Course**](https://tinyurl.com/2p8dxbwn)

### 🚀 **DevSecOps Fundamentals**
- A foundational course covering the core concepts of DevSecOps for beginners.  
[**DevSecOps Fundamentals**](https://shorturl.at/H9kqG)

### 🚀 **SonarQube**
- Master SonarQube to analyze and improve the quality of your code with automated security checks.  
[**SonarQube Course**](https://tinyurl.com/mzfukn4p)

### 🚀 **Serverless**
- Dive into serverless architectures and build efficient, scalable applications.  
[**Serverless Course**](https://tinyurl.com/st5xde5z)

### 🚀 **Docker**
- Learn Docker, containerization, and Kubernetes to run your apps in any environment effortlessly.  
[**Docker Course**](https://tinyurl.com/2ffv8yjn)

### 🚀 **CI/CD Jenkins Master**
- Master Jenkins and automate your software build and delivery pipeline.  
[**Jenkins Master Course**](https://rb.gy/u0ygq)

### 🚀 **Free Linux Course: Introduction to Linux Crash Course**
- Get started with Linux, the backbone of many modern IT systems.  
[**Linux Crash Course**](https://www.udemy.com/course/introduction-to-linux-crash-course)

### 🚀 **AWS DevOps Certification: DOP-C01 Practice Test**
- Prepare for the AWS DevOps Engineer - Professional exam with this practice test.  
[**AWS DevOps Practice Test**](https://www.udemy.com/course/aws-devops-practice-test/?referralCode=D8209AD57D310A001C78)


---

## Course Tags:
**#DevSecOps** | **#DevOps** | **#SonarQube** | **#infosec** | **#security** | **#sast** | **#serverless** | **#cloud** | **#computing** | **#CI/CD** | **#Jenkins** | **#Docker** | **#Linux** | **#containerization** | **#automation** | **#AWS** | **#DevOpsCertification**

---

### 🚀 Reach out for any **discounts** available this month!

Thank you for visiting! Don't forget to check out the courses and **reach out for discounts**!
