# DevOps-CI-CD

## Jerarquia de archivos
```
.
├── .circleci
│   ├── config.yml
│   └── README.md
├── code
│   ├── client/
|   ├── microservicio-movimientos/
|   ├── microservicio-productos/
|   ├── microservicio-proveedores/
|   ├── microservicio-reportes/
│   └── microservicio-vendedores/
├── db
│   ├── scripts/
│   ├── init.sql
│   └── filename.sql
├── deployment
│   ├── K8/
│   ├── Terraform/
│   └── TerraformDNS/
├── manuales
│   ├── Gifs/
│   └── Readme.md
└── README.md
```

## Modulos
- [.circleci](/.circleci)
- [code](./code)
- [db](./db)
- [deployment](./deployment)
- [Manual de usuario](./manuales/)

# Como funciona?
El proceso de DevOps CI/CD emplea un flujo de trabajo que se detalla en el archivo [.circleci/config.yml](.circleci/config.yml). 

# Primeros Pasos

Para que las herramientas funcionen se deben de configurar ciertos recursos y servicios en Google Cloud Platform.
## Paso 1: 
Crear un proyecto
![imagen](manuales/Gifs/Configuraciones/paso1.gif)

## Paso 2: 
Crear una cuenta de servicio y crear una clave JSON para acceder al proyecto via CLI
![imagen](manuales/Gifs/Configuraciones/paso2.gif)

## Paso 3: 
Crear un Bucket de nombre "backend-terraform-devops-ci-cd" con permisos uniforme
![imagen](manuales/Gifs/Configuraciones/paso3.gif)

## Paso 4: 
Agregar variables de entorno al repositorio que se esta siguiendo en CircleCI.
  - **CREDENTIALS**: El valor de esta variable entorno es el contenido completo de la clave JSON generada en el paso 2
  - **DOCKERHUB_PASS**: El password de la cuenta de docker hub para subir las imagenes (artefactos)
  - **DOCKERHUB_USERNAME**: El nombre de usario utilizado para logearse en Docker Hub
  - **GOOGLE_COMPUTE_ZONE**: La zona en la que se quieren desplegar los recursos (se recomiend us-central1-a)
  - **PROJECT_ID**: El id del proyecto creado en GCP. 
  
![imagen](manuales/Gifs/Configuraciones/paso4.gif)

## Paso 5:
Crear una zona DNS de nombre "zona" para "poliformas.com.gt."
![imagen](manuales/Gifs/Configuraciones/paso5.gif)

## Paso 6:
Antes de desplegar los recursos se deben de **habilitar** las siguientes APIS en google cloud platform
- Cloud SQL Admin API
- Kubernetes Engine API

![imagen](manuales/Gifs/Configuraciones/paso6.gif)


## Paso 7 - Alternativa 1: 
La alternativa mas sencilla para desplegar la infraestructura y configurarla automaticamente se debe de realizar lo siguiente:
- Cambiar en la rama infraestrucura (git checkout infrastructure)
- En cualquier archivo agregar un espacio 
- Crer un commit para lanzar los jobs y CircleCI se encargue del resto.

![imagen](manuales/Gifs/Configuraciones/paso8.gif)


## Paso 7 - Alternativa 2:
En esta alternativa se despliega y configura la infraestructura de manera manual.
Se necesita tener instalado de manera local:
- Terraform 0.12.28

![alt imagen](manuales/Gifs/Configuraciones/paso7-2.1.png)

- Gcloud

![alt imagen](manuales/Gifs/Configuraciones/paso7-2.2.png)

- Kclubectl

![alt imagen](manuales/Gifs/Configuraciones/paso7-2.3.png)

- **Paso A**: establecer algunas variables de entorno.
  - export GOOGLE_APPLICATION_CREDENTIALS=**"ruta del archivo json descargado"**
  - export TF_VAR_project_id=**"Id del proyecto"**

- **Paso B**: Abrir una terminal en la carpeta deployment/Terraform
- **Paso C**: Ejecutar los siguientes comandos
```
  terraform init
  terraform plan -out plan.out
  terraform apply plan.out
```
Los recursos estaran en proceso de creacion..
![imagen](manuales/Gifs/Configuraciones/paso7.gif)

Luego de cierto tiempo los recursos habrán terminado de ejecutarse
![imagen](manuales/Gifs/Configuraciones/paso7.2.gif)



# Herramientas

## Backend - NodeJS

<img src="manuales/Gifs/Logos/nodejs.png" width="500" >


## Frontend - Vuejs

<img src="manuales/Gifs/Logos/vuejs.png" width="500" >

## Despliegue

- Docker

![imagen](manuales/Gifs/Logos/docker.png)

- Kubernetes

<img src="manuales/Gifs/Logos/kubernetes.png" width="350" >


## DevOps Tools

- Terraform

![imagen](manuales/Gifs/Logos/terraform.png)

- Circle Ci

![imagen](manuales/Gifs/Logos/circleci.png)
