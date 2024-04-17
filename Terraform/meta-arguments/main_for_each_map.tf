terraform {
        required_providers {
                aws = {
                        source = "hashicorp/aws"
                        version = "~> 4.16"
                }
        }
        required_version = ">= 1.2.0"
}

provider "aws" {
        region = "us-east-1"
}

locals {
        instances = {"yash":"ami-0440d3b780d96b29d", "udit":"ami-0f9c44e98edf38a2b", "aadar"::
"ami-0fe630eb857a6ec83", "himanshu":"ami-07d9b9ddc6cd8dd30", "raj":"ami-05efd9e66ddc3cf4b"}
}

resource "aws_instance" "aws_ec2_test" {
        for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
                Name = each.key
        }
}