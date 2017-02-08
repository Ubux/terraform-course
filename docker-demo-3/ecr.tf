resource "aws_ecr_repository" "myapp" {
  name = "myapp"
}
resource "aws_ecr_repository" "account" {
  name = "account"
}
