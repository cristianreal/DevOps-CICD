output "cluster_name" {
  value = "${google_container_cluster.primary.name}"
}

output "kubeconfig_path" {
  value = local_file.kubeconfig.filename
}