# >>>>>>> Nombre Cluster K8 <<<<<<<<<<<<<
variable "project_id" {
  type        = string
  description = "The id of the gcp project."
}

variable "cloudsql_instance_ip" {
    description = "ip of cloud sql instace"
    type        = string
}
variable "ingress_controller_ip" {
    description = "ip of ingress controller"
    type        = string
}