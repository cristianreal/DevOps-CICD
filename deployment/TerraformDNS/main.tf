data "google_dns_managed_zone" "dominio_poliformas" {
  name = "zona"
  project = var.project_id
}

resource "google_dns_record_set" "record_a_db" {
  project = var.project_id

  name = "db.${data.google_dns_managed_zone.dominio_poliformas.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [var.cloudsql_instance_ip]

}

resource "google_dns_record_set" "record_a_ingress_controller" {
  project = var.project_id

  name = data.google_dns_managed_zone.dominio_poliformas.dns_name
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [var.ingress_controller_ip,]
  
}

resource "google_dns_record_set" "record_cname" {
  project = var.project_id

  name         = "www.${data.google_dns_managed_zone.dominio_poliformas.dns_name}"
  type         = "CNAME"
  ttl          = 300
  
  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name
  
  rrdatas      = [data.google_dns_managed_zone.dominio_poliformas.dns_name]
}