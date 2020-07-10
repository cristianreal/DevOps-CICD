variable "project_id" {
  type        = string
  description = "The id of the gcp project."
}

provider "google" {
  project     = var.project_id
}

terraform {
  backend "gcs" {
    bucket  = "backend-terraform-devops-ci-cd"
    prefix  = "terraform/state"
  }
}

module "BD" {
  source = "./cloud_sql"
}

module "K8" {
  source = "./cluster_k8" 
}