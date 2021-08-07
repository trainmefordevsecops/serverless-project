resource "aws_ecr_repository" "myapp" {
  name = "python-fact"
}

output "myapp-repo" {
  value = "${aws_ecr_repository.myapp.repository_url}"
}
