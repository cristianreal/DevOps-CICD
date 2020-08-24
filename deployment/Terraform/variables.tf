# >>>>>>> Nombre Cluster K8 <<<<<<<<<<<<<
variable "project_id" {
  type        = string
  description = "The id of the gcp project."
}
# >>>>>>> Region         <<<<<<<<<<<<<<<<
variable "region" {
    description = "Google Cloud regions"
    type        = string
    default     = "us-central1"
}
# >>>>>>> Zona         <<<<<<<<<<<<<<<<
variable "zone" {
    description = "Google Cloud zone"
    type        = string
    default     = "us-central1-a"
}
# >>>>>>> Nombre Cluster K8 <<<<<<<<<<<<<
variable "k8_cluster_name" {
  type        = string
  description = "The id of the gcp project."
}
# >>>>>>> Nombre Instancia CloudSQL <<<<<<<<<<<<<<<<
variable "cloudsql_instance_name" {
    description = "Google Cloud zone"
    type        = string
}
# >>>>>>> Tamanio Instancia CloudSQL <<<<<<<<<<<<<<<<
variable "cloudsql_instance_type" {
    description = "Google Cloud type"
    type        = string
}
# >>>>>>> DBMS de la instancia CloudSQL <<<<<<<<<<<<<<<<
variable "cloudsql_dbms" {
    description = "Google Cloud type"
    type        = string
}
# >>>>>>> Nombre Base de Datos inicial <<<<<<<<<<<<<<<<
variable "database_name" {
    description = "Google Cloud type"
    type        = string
}