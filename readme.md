# INFOSYS 735 Group Project Assessment

## Authors

- Steven Lei
- Feihao Shi
- Mingze Du
- Congyu Zhao

## Project Overview

This project automates infrastructure deployment using **AWS CloudFormation** for a multi-tier application setup.

## Objectives

- Automate the deployment of network and database infrastructure using CloudFormation.
- Ensure security and scalability by configuring VPCs, subnets, route tables, NAT gateways, and security groups.
- Implement HTTPS access by deploying LaunchTemplate, AutoScaling Group, Load Balancer, using certificate from ACM
- Deploy an RDS Oracle instance with secure credentials managed in AWS Secrets Manager.
- SNS notification for server stop
- S3 for website frontend
- API gateway
- Gateway Endpoint allowing securing access S3 and RDS
- a simple website(backend) with Oracle DB connection

## Modules

### 1. Network Template

This template sets up the core network infrastructure.

**Features:**

- Create a VPC according to the infrastructure diagram.
- Configure an Internet Gateway and public/private route tables.
- Deploy public, APP, and DB subnets across multiple Availability Zones.
- Set up NAT Gateways for private subnets.

- Outputs: VPC ID, Subnet IDs.

### 2. SecurityGroup Template

Configure Security Groups:

- ALB: allow HTTP(80) from anywhere, allow HTTPS (443) from anywhere
- APP: allow HTTP (80) from ALB Security Group only
- RDS: allow Oracle port (1521) from APP Security Group only

- Outputs: Security Group IDs.

### 3. LaunchTemplate Template

- Create a LaunchTemplate using specific ImageID:

- Outputs: LaunchTemplateId, Version for AutoScaling Group.

### 4. Autoscaling Template

- Create a TargetGroup
- Create an AutoScaling Group

### 5. Webserver Template

- Create a Webserver in Public Subnet(can be used to create golden image)

### 6. ALB template

- Create Application Load Balancer using certificate from ACM(need to be precreated)
- Create ALB Listener for HTTP, HTTPS
- Create A record pointed to the LoadBalancer to valid https://anygroup.theflower.co.nz

### 7. DB Template

This template uses the Network Template as a nested stack and provisions database resources.

**Features:**

- Create an RDS Oracle Subnet Group using the DB subnets.
- Create a Secrets Manager secret to store the RDS master username and password.
- Deploy an RDS Oracle instance with the DB Security Group from the Network Template.
- Outputs: RDS Endpoint, RDS Port

## Deployment Instructions

Environment:

In Academy Learn Lab or any CLI environment:

## Steps

- clone cloudformation template

  **git clone https://github.com/Steven-lei/INFOSYS735-groupassessment2.git**

- change directory

  **cd INFOSYS735-groupassessment2/**

- create s3 bucket to hold the templates

  **s3api create-bucket --bucket anygroup-templates --query "Location" --output text**

  _anygroup-templates is the bucketname_

- upload to S3 bucket

  **aws s3 sync . s3://anygroup-templates --region us-east-1 --exclude ".git/\*"**

- deploy with main.yaml (the others are nested and will be run automatically)

  Deploy the main.yaml from Console or using the following CLI command

  eg, run cloudformation with the s3 url: https://anygroup-templates.s3.us-east-1.amazonaws.com/main.yaml

  aws cloudformation create-stack \
   --stack-name MyStack \
   --template-body file://template.yaml \
   --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND

  To create the whole environment using the s3 url:
  https://anygroup-templates.s3.us-east-1.amazonaws.com/main.yaml

  To create a webserver allowing to create golden image using the s3 url:
  https://anygroup-templates.s3.us-east-1.amazonaws.com/webserver.yaml
