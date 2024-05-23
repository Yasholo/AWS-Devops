#!/bin/bash

# Set the working directory for Terraform scripts if not already there

# Log files
TERRAFORM_LOG="terraform.log"
DEPLOY_LOG="deploy.log"

# Step 1: Execute the Terraform scripts
echo "Executing Terraform scripts..."
{
  terraform init &&
  terraform plan &&
  terraform apply -auto-approve
} >> "$TERRAFORM_LOG" 2>&1

if [ $? -ne 0 ]; then
  echo "Terraform scripts execution failed. Check the log file for details: $TERRAFORM_LOG"
  exit 1
fi

echo "Terraform scripts executed successfully."

# Step 2: Deploy the web application
echo "Deploying the web application..."
{
  ./deploy_web_app.sh
} >> "$DEPLOY_LOG" 2>&1

if [ $? -ne 0 ]; then
  echo "Web application deployment failed. Check the log file for details: $DEPLOY_LOG"
  exit 1
fi

echo "Web application deployed successfully."
