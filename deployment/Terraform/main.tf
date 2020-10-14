# >>>>>>> Proveedor de servicios <<<<<<<<<<
provider "google" {
  project     = var.project_id
}
# >>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<
# >>>>>>> ID de los recursos <<<<<<<<<<<<<<<
resource "random_id" "name" {
  byte_length = 2
}
# >>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<
# >>>>>>> Base de Datos (CloudSQL) <<<<<<<<<<<
module "DB" {
  source = "./cloud_sql"
  cloudsql_instance_name = var.cloudsql_instance_name
  region =  var.region
  cloudsql_instance_type = var.cloudsql_instance_type
  cloudsql_dbms = var.cloudsql_dbms
  database_name = var.database_name
  db_username = var.db_username
  db_password = var.db_password
  sufijo = random_id.name.hex
}
# >>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# >>>>>>>> Cluster K8 (GKE) <<<<<<<<<<<<<<<<<<<
module "K8" {
  source = "./cluster_k8" 
  sufijo = random_id.name.hex
  cluster_username = var.db_username
  cluster_password = var.db_password
  k8_cluster_name = var.k8_cluster_name
}
# >>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<
