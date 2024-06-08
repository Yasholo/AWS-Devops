#!/bin/bash

# Set the working directory for Terraform scripts if not already there
#WORKING_DIR="./"
#cd "$WORKING_DIR" || { echo "Failed to change directory to $WORKING_DIR"; exit 1; }

# Log files
TERRAFORM_LOG="terraform_$(date +%Y%m%d_%H%M%S).log"

# Step 1: Execute the Terraform scripts
echo "Executing Terraform scripts..."
{
  echo "==== $(date +'%Y-%m-%d %H:%M:%S') Starting Terraform Init ===="
  terraform init &&
  echo "==== $(date +'%Y-%m-%d %H:%M:%S') Starting Terraform Validate ===="
  terraform validate &&
  echo "==== $(date +'%Y-%m-%d %H:%M:%S') Starting Terraform Plan ===="
  terraform plan &&
  echo "==== $(date +'%Y-%m-%d %H:%M:%S') Starting Terraform Apply ===="
  terraform apply -auto-approve
} >> "$TERRAFORM_LOG" 2>&1

if [ $? -ne 0 ]; then
  echo "Terraform scripts execution failed. Check the log file for details: $TERRAFORM_LOG"
  exit 1
fi

echo "Terraform scripts executed successfully."


