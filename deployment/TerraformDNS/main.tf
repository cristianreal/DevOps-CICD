data "google_dns_managed_zone" "dominio_poliformas" {
  name    = "zona"
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

# Record A   poliformas.com.gt
resource "google_dns_record_set" "record_a_ingress_controller" {
  project = var.project_id

  name = data.google_dns_managed_zone.dominio_poliformas.dns_name
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [var.ingress_controller_ip, ]

}

resource "google_dns_record_set" "record_cname" {
  project = var.project_id

  name = "www.${google_dns_record_set.record_a_ingress_controller.name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [google_dns_record_set.record_a_ingress_controller.name, ]
}

# Record A    prometheus.poliformas.com.gt
resource "google_dns_record_set" "record_a_prometheus" {
  project = var.project_id

  name = "prometheus.${data.google_dns_managed_zone.dominio_poliformas.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [var.ingress_controller_ip, ]

}

resource "google_dns_record_set" "record_cname_prometheus" {
  project = var.project_id

  name = "www.${google_dns_record_set.record_a_prometheus.name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [google_dns_record_set.record_a_prometheus.name, ]
}



# Record A    grafana.poliformas.com.gt
resource "google_dns_record_set" "record_a_grafana" {
  project = var.project_id

  name = "grafana.${data.google_dns_managed_zone.dominio_poliformas.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [var.ingress_controller_ip, ]

}

resource "google_dns_record_set" "record_cname_grafana" {
  project = var.project_id

  name = "www.${google_dns_record_set.record_a_grafana.name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [google_dns_record_set.record_a_grafana.name, ]
}

# Record A    backend.poliformas.com.gt
resource "google_dns_record_set" "record_a_backend" {
  project = var.project_id

  name = "backend.${data.google_dns_managed_zone.dominio_poliformas.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [var.ingress_controller_ip, ]

}

resource "google_dns_record_set" "record_cname_backend" {
  project = var.project_id

  name = "www.${google_dns_record_set.record_a_backend.name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.dominio_poliformas.name

  rrdatas = [google_dns_record_set.record_a_backend.name, ]
}
