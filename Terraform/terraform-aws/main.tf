terraform {
        required_providers {
                aws = {
                        source = "hashicorp/aws"
                        version = "~>4.16"
                }
        }
        required_version = ">=1.2.0"
}

provider "aws" {
        region = "us-east-1"
}

resource "aws_instance" "my_ec2_instance" {
        count = 5
        ami = "ami-07d9b9ddc6cd8dd30"
        instance_type = "t2.micro"
        tags = {
                Name = "Terraform-aws-instance"
        }
}

output "ec2_public_ips" {
        value = aws_instance.my_ec2_instance[*].public_ip
}

resource "aws_s3_bucket" "my_s3_bucket" {
        bucket = "terraform-s3-bucket-6969"
        tags = {
                Name = "terraform-s3-bucket-69"
                Environment = "Dev"
        }
}