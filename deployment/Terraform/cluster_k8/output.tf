output "cluster_name" {
  value = "${google_container_cluster.primary.name}"
}

output "kubeconfig_path" {
  value = local_file.kubeconfig.filename
}

output "kubeconfig_data" {
  value = data.template_file.kubeconfig.rendered
}