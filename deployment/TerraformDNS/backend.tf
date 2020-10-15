terraform {
  backend "gcs" {
    bucket  = "backend-terraform-devops-ci-cd"
    prefix  = "terraform/cloud_dns"
  }
}