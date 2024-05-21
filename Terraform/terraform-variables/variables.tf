variable "filename" {
        default = "/home/ubuntu/terraform/terraform-variables/devops-automated.txt"
}

variable "content" {
        default = "This is auto generated from a variable."
}

variable "devops_op_trainer" {}

variable "content_map" {
        type = map
        default = {
                "content1" = "this is cool content 1"
                "content2" = "this is cooler content 2"
        }
}

variable "file_list" {
        type = list
        default = ["/home/ubuntu/terraform/terraform-variables/file_1.txt", "/home/ubuntu/terraform//
terraform-variables/file_2.txt"]
}

variable "aws_ec2_object" {
        type = object({
                name = string
                instances = number
                keys = list(string)
                ami = string
        })
        default = {
                name = "test_ec2_instance"
                instances = 4
                keys = ["key1.pem", "key2.pem"]
                ami = "ubuntu-afekq234"
        }
}