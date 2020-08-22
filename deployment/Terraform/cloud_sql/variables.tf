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
# >>>>>>> Region         <<<<<<<<<<<<<<<<
variable "region" {
    description = "Google Cloud regions"
    type        = string
}
variable "sufijo" {
    description = "Google Cloud regions"
    type        = string
}

variable "name_override" {
  description = "You may optionally override the name_prefix + random string by specifying an override"
  default     = ""
}