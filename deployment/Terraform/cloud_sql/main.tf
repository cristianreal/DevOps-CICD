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



resource "google_sql_database_instance" "instance" {
  name             = length(var.name_override) == 0 ? format("%s-%s", var.cloudsql_instance_name, var.sufijo) : var.name_override
  database_version = var.cloudsql_dbms
  region           = var.region

  settings {
    tier = var.cloudsql_instance_type
  }
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database" "database-test" {
  name     = format("%s-%s", var.database_name, "test") 
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "users" {
  instance = google_sql_database_instance.instance.name
  name     = "root"
  host     = "%"
  password = "123456"
}
