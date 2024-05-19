# 📌 Multi-Tier Architecture on AWS using Terraform

Create a scalable and robust multi-tier architecture on AWS utilizing Terraform.

## 🏁 Project Overview

This project aims to deploy a multi-tier architecture on AWS, consisting of three tiers: the Presentation Layer (Web Tier), the Application Layer, and the Data Layer (Database Tier). Each tier will be deployed using Terraform to automate infrastructure provisioning, configuration, and management. We'll also include monitoring and logging components.

1. **Web Tier**:

   - Two EC2 instances serving as web servers.
   - An Application Load Balancer to distribute incoming traffic.

2. **Application Tier**:

   - Two EC2 instances running our application.

3. **Database Tier**:

   - An Amazon RDS MySQL database to store application data.

4. **Monitoring and Logging**:
   - CloudWatch alarms for monitoring resource usage.
   - CloudWatch logs for logging application events.



## Prerequisites

- **AWS Account**: You need an active AWS account to provision resources and services on the AWS cloud platform.

- **AWS Access Credentials**: Obtain AWS access credentials with appropriate permissions to create and manage resources. This involves creating an IAM user with programmatic access and attaching policies that grant necessary permissions.

- **Terraform Installed**: Install Terraform on your local machine or development environment. 
You can follow this [article on terraform installation](https://medium.com/@Yasholo/terraform-a-guide-ff06bd539040).

- **AWS CLI Installed and Configured**: Install the AWS Command Line Interface (CLI) on your machine and configure it with your AWS access credentials. This allows Terraform to interact with AWS services on your behalf. 
You can follow this [article on AWS CLI Installation.](https://medium.com/@Yasholo/aws-command-line-interface-cli-install-and-configure-8e70e6831074).


## 📋Index

- [Objective](#-Objective)
- [Key Features](#-Key-Features)
- [Terraform Structure](#-Terraform-Structure)
- [Database Tier](#-database-tier)
- [Terraform Configuration](#-terraform-configuration)
- [Deployment](#-deployment)
- [Usage](#-usage)
- [Contributing](#-contributing)
- [License](#-license)

## 🌟 Objective

- Deploy a scalable and resilient multi-tier web application architecture on AWS using Terraform.

- Separate the application into distinct layers for presentation, application logic, and data storage.

- Ensure high availability, fault tolerance, and security across all layers of the architecture.

## 🌠 Key Features

- **Modularity:** Utilize Terraform modules to encapsulate each tier's components, enabling reusability and maintainability.

- **Scalability:** Implement Auto Scaling Groups to dynamically scale resources based on demand, ensuring optimal performance and cost efficiency.

- **High Availability:** Deploy resources across multiple Availability Zones (AZs) to enhance fault tolerance and maintain continuous availability.

- **Security:** Utilize AWS Identity and Access Management (IAM), security groups, and encryption mechanisms to enforce data security and compliance.

- **Monitoring and Logging:** Integrate AWS CloudWatch for monitoring resource utilization, application performance, and operational metrics.

- **Infrastructure as Code (IaC):** Implement infrastructure deployment and management using Terraform, enabling version-controlled, repeatable, and consistent infrastructure configurations.


# 🔭 Architecture Components:

## 🖥️ Web Tier (Presentation Layer)

Serves as the entry point for user requests. It consists of:

- **Web Servers:** EC2 instances running web server software. These servers host the frontend components of the application and other static assets. Web servers handle incoming HTTP/HTTPS requests from clients and generate responses based on the requested resources.

- **Load Balancer (ALB):** Attach a Load Balancer (**aws_lb**) in front of the Auto Scaling Group to distribute incoming traffic.

- **Security Groups:** Define security groups (**aws_security_group**) to control traffic to and from the web tier.

- **Auto Scaling Group:** Launch an Auto Scaling Group (**aws_autoscaling_group**) of EC2 instances running your web servers in the public subnet.

### Web Tier Configurations

## 🧮 Application Tier (Application Layer)

It contains the application's core logic and processing capabilities and handles business logic, processing user requests, and generating responses. Interacts with the Web Tier and Database Tier.

- **Application Servers:** EC2 instances or containers execute the core functionality of the application, running the application code and business logic. Deploy another Auto Scaling Group of EC2 instances or containers in the private subnet to run your application logic.

- **Security Groups:** Security groups associated with the application servers control inbound and outbound traffic, defining firewall rules to restrict access to specific ports and protocols. Again, use security groups to control access to these instances.

### Application Tier Configurations

## 💾 Database Tier (Data Layer)

Stores and manages application data persistently. Ensures data integrity, consistency, and durability through backups and replication.

- **Amazon RDS:** Set up a managed database service like Amazon RDS (**aws_db_instance**) for your relational database, or Amazon DynamoDB (**aws_dynamodb_table**) for a NoSQL database.

- **Security Groups:** Configure appropriate security groups and access controls for the database.

- **Subnet Group:** Ensure the database resources are in a private subnet for security reasons.

### Database Tier Configuration

## 🔌 Network Layer
   - **Network infrastructure**: Defines the network infrastructure, including VPC, subnets, routing, and connectivity.

   - Ensures isolation, security, and proper traffic routing between different tiers of the architecture.

   - Facilitates communication between components while adhering to best practices for security and compliance.

### Network Layer Configuration

## 📈 Monitoring and Logging:

   - Integrate CloudWatch (**aws_cloudwatch_dashboard**, **aws_cloudwatch_log_group**) for monitoring resource usage and application logs.

   - Consider deploying AWS Config (**aws_config_configuration_recorder**) and AWS CloudTrail (**aws_cloudtrail**) for auditing and compliance purposes.


## 🧬 Terraform Structure

    terraform-project/
    │
    ├── main.tf            # Main Terraform configuration file
    ├── variables.tf       # Input variables
    ├── outputs.tf         # Output variables
    ├── terraform.tfvars   # Terraform variable values (optional)
    └── modules/           # Directory for reusable modules (optional)
        ├── presentation/
        ├── application/
        └── data/

## ⚙️ Terraform Configuration
Tip: You can follow the [official terraform aws documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) if you ever get stuck while setting up your resources. (use the search bar to get information about a particular object.)



## 🚀 Deployment

To deploy the project, follow these steps:

1. Install Terraform on your local machine.
2. Set up AWS credentials with appropriate permissions.
3. Initialize Terraform in the project directory: '**terraform init**'.
4. Optionally, customize terraform.tfvars with your variable values.
5. Run '**terraform plan**' to see the execution plan.
6. Run '**terraform apply**' to apply the changes and provision the infrastructure.
7. After deployment, access the web application using the Load Balancer's DNS name.

## Future Enhancements

- **Serverless Integration**: Explore integration with AWS Lambda for serverless computing and event-driven architectures.

- **Container Orchestration**: Implement container orchestration platforms like Amazon ECS or Kubernetes for containerized workloads.

- **Advanced Monitoring**: Enhance monitoring and observability with AWS X-Ray, AWS CloudTrail, and third-party monitoring tools.

- **Continuous Integration/Continuous Deployment (CI/CD)**: Implement CI/CD pipelines for automated testing, validation, and deployment of infrastructure changes.