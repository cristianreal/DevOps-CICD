# Terraform
Terraform es una herramienta open source para el aprovisionamiento de infraestructura en la nube a traves de codigo. Es muy popular debido a que tiene integracion con multiples proveedores de servicios.

La forma en que funciona es que se escriben archivos con sintaxis yml pero con extension .tf al ejecutarse estos archivos generaran varios archivos internos para que terraform maneje el estado de los recursos y sepa que recursos se estan ejecutando. Sin embargo, si se pierde este archivo state se pierde por completo el historial de los recursos y se crearan unos nuevos al ejecutar los archivos. Para evitar esto se guarda el archivo state en un servicio para almacenar objetos, en aws se guarda en s3, en google clou en cloud storage.

## Main file
Este es el archivo principal. Observaciones:
* El bloque de tipo variable funciona como parametro.
* El bloque provider es para indicarle a que proveedor de servicios se conectara. En este caso google.
* El bloque terraform, backen es para indicarle el bucket o almacen donde se almacenara el archivo state.
* Los bloques module sirven para llamar y ejecutar otros archivos de terraform.
    * module BD: va a ejecutar el archivo .tf que crea la bd en cloud SQL
    * module k8: va a ejecutar el archivo .t tf que crea el cluster en k8.
```
variable "project_id" {
  type        = string
  description = "The id of the gcp project."
}

provider "google" {
  project     = var.project_id
}

terraform {
  backend "gcs" {
    bucket  = "backend-terraform-inventario"
    prefix  = "terraform/state"
  }
}

module "BD" {
  source = "./cloud_sql"
}

module "K8" {
  source = "./cluster_k8" 
}

```

## module BD
```
resource "google_sql_database_instance" "master" {
  name             = "master-instance"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

```

## module K8
Observaciones:
*  El recurso **google_container_cluster** sirve para crear el cluster de gke.
* El recurso  **google_container_node_pool** sirve para definir un template de los nodos worker del cluster gke.
```
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"

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
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
```