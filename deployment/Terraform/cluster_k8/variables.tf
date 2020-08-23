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