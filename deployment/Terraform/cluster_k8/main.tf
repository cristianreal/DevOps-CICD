data "google_service_account" "myaccount" {
  account_id = var.service_account_name
}

resource "google_container_cluster" "primary" {
  name     = format("%s-%s-cluster", var.k8_cluster_name, var.sufijo)
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

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

    service_account = data.google_service_account.myaccount.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
