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

variable "db_username" {
    description = "Username of cloud sql database"
    type        = string
}

variable "db_password" {
    description = "Password of cloud sql database"
    type        = string
}