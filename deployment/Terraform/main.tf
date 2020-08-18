# >>>>>>> Proveedor de servicios <<<<<<<<<<
provider "google" {
  project     = var.project_id
}

resource "random_id" "name" {
  byte_length = 2
}

/*# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
name     = var.bucket_name
location = var.region
}*/

module "BD" {
  source = "./cloud_sql"
  cloudsql_instance_name = var.cloudsql_instance_name
  region =  var.region
  cloudsql_instance_type = var.cloudsql_instance_type
  cloudsql_dbms = var.cloudsql_dbms
  database_name = var.database_name
  sufijo = random_id.name.hex
}

module "K8" {
  source = "./cluster_k8" 
  sufijo = random_id.name.hex
  k8_cluster_name = "devops-ci-cd"
}