resource "local_file" "devops" {
        filename = var.file_list[0]
        content = var.content_map["content1"]
}

resource "local_file" "devops-var" {
        filename = var.file_list[1]
        content = var.content_map["content2"]
}

output "devops_op_trainer" {
        value = var.devops_op_trainer
}

output "aws_ec2_info" {
        value = var.aws_ec2_object
}

output "tf_batch_students" {
        value = var.no_of_students
}