output "cloudsql_instance_name" {
  value = "${google_sql_database_instance.instance.name}"
}
output "cloudsql_instance_ip" {
  value = "${google_sql_database_instance.instance.ip_address.0.ip_address}"
}