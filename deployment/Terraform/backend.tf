# >>>>>> Backend para guardar estado de infraestructura <<<<<<
terraform {
  backend "gcs" {
    bucket  = "backend-terraform-devops-ci-cd"
    prefix  = "terraform/state"
  }
}