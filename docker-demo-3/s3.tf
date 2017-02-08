resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-pr-ubux-state-test"
    acl = "private"

    tags {
        Name = "Terraform state"
    }
}
