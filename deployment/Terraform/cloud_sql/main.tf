resource "google_sql_database_instance" "instance" {
  name             = length(var.name_override) == 0 ? format("%s-%s", var.cloudsql_instance_name, var.sufijo) : var.name_override
  database_version = var.cloudsql_dbms
  region           = var.region

  settings {
    tier = var.cloudsql_instance_type
    ip_configuration {
        authorized_networks {
         name  = "all"
         value = "0.0.0.0/0"
        }
    }
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