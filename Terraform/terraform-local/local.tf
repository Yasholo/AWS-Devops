resource "local_file" "devops" {
        filename = "/home/ubuntu/terraform/terraform-local/devops_automated.txt"
        content = "I want to become a DevOps Engineer who knows Terraform."
}

resource "random_string" "rand-str" {
        length = 16
        special = true
        override_special = "!#$%&*()-_=+[]{}<>:?"
}

output "rand-str" {
        value = random_string.rand-str[*].result
}