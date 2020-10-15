output "random" {
  value = "${random_id.name.hex}"
}
output "cluster_name" {
  value = "${module.K8.cluster_name}"
}

output "kubeconfig_path" {
  value = "${module.K8.kubeconfig_path}"
}

output "cloudsql_instance_name" {
  value = "${module.DB.cloudsql_instance_name}"
}
output "cloudsql_instance_ip" {
  value = "${module.DB.cloudsql_instance_ip}"
}