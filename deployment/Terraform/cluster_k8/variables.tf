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
    default = "n1-standard-2"
}
variable "zone" {
    description = "Google Cloud zone"
    type        = string
    default     = "us-central1-a"
}

variable "cluster_username" {
    description = "Username of cloud sql database"
    type        = string
}

variable "cluster_password" {
    description = "Password of cloud sql database"
    type        = string
}
variable "service_account_name" {
    description = "name of service account"
    type        = string
}