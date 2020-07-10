resource "google_sql_database_instance" "master" {
  name             = "devops-ci-cd-db"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}
