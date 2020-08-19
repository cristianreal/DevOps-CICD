variable "sufijo" {
    description = "Google Cloud regions"
    type        = string
}

variable "k8_cluster_name" {
    description = "Google Cloud zone"
    type        = string
}
variable "k8_node_type" {
    description = "Google Cloud zone"
    type        = string
    default = "n1-standard-1"
}
variable "zone" {
    description = "Google Cloud zone"
    type        = string
    default     = "us-central1-a"
}


resource "google_container_cluster" "primary" {
  name     = format("%s-%s-cluster", var.k8_cluster_name, var.sufijo)
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

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
    max_node_count = 2
    min_node_count = 1
  }
  
  node_config {
    machine_type = var.k8_node_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
