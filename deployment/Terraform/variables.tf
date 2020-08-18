# >>>>>>> Nombre proyecto GCP <<<<<<<<<<<<<
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
# >>>>>>> Availavility zone <<<<<<<<<<<<<<<<
variable "bucket_name" {
    description = "Google Cloud zone"
    type        = string
}
# >>>>>>> Availavility zone <<<<<<<<<<<<<<<<
variable "cloudsql_instance_name" {
    description = "Google Cloud zone"
    type        = string
}
# >>>>>>> Availavility zone <<<<<<<<<<<<<<<<
variable "cloudsql_instance_type" {
    description = "Google Cloud type"
    type        = string
}
# >>>>>>> Availavility zone <<<<<<<<<<<<<<<<
variable "cloudsql_dbms" {
    description = "Google Cloud type"
    type        = string
}
# >>>>>>> Availavility zone <<<<<<<<<<<<<<<<
variable "database_name" {
    description = "Google Cloud type"
    type        = string
}