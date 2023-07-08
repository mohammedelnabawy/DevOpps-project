terraform {
  backend "s3" {
    bucket = "devops-project-state-file"
    region = "us-east-1"
  }
}