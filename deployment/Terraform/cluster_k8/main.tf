resource "google_container_cluster" "primary" {
  name     = format("%s-%s-cluster", var.k8_cluster_name, var.sufijo)
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = var.cluster_username
    password = var.cluster_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = format("%s-%s-node-pool", var.k8_cluster_name, var.sufijo)
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1

  autoscaling {
    max_node_count = 4
    min_node_count = 1
  }

  node_config {
    machine_type = var.k8_node_type
    disk_size_gb = 50

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}


data "template_file" "kubeconfig" {
  template = file("${path.module}/kubeconfig-template.yaml")

  vars = {
    cluster_name    = google_container_cluster.primary.name
    user_name       = google_container_cluster.primary.master_auth[0].username
    user_password   = google_container_cluster.primary.master_auth[0].password
    endpoint        = google_container_cluster.primary.endpoint
    cluster_ca      = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
    client_cert     = google_container_cluster.primary.master_auth[0].client_certificate
    client_cert_key = google_container_cluster.primary.master_auth[0].client_key
  }
}

resource "local_file" "kubeconfig" {
  content  = data.template_file.kubeconfig.rendered
  filename = "${path.module}/config"
}


