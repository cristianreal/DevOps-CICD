# Arquitectura de la aplicacion
![img](../manuales/Gifs/Tecnico/Arquitectura.png)

# Monitoreo con Prometheus

https://prometheus.poliformas.com.gt/graph

<img src="../manuales/Gifs/Tecnico/Prometheus.gif" width="500" >

# Monitoreo con Grafana utilizando prometheus como datasource

https://grafana.poliformas.com.gt/

<img src="../manuales/Gifs/Tecnico/Grafana.gif" width="500" >

# workflows

Solo existe un workflow:
- ***pipeline-principal***
Sin embargo este ejecuta diferente jobs dependiendo de la rama origen del commit que dispara el workflow en CircleCi.

## Rama infrastructure

![alt image](../manuales/Gifs/circleci/job-infrastructure.png)

## Rama developer

![alt image](../manuales/Gifs/circleci/job-developer.png)

## Rama master

![alt image](../manuales/Gifs/circleci/job-master-hotfix.png)

## Rama hotfix

![alt image](../manuales/Gifs/circleci/job-master-hotfix.png)

Este proceso puede encontrarse mas detallado en [Pipeline CircleCI](../.circleci)

# Tecnologias

## Microservicios Backend - NodeJS

<img src="../manuales/Gifs/Logos/nodejs.png" width="500" >


## Frontend - Vuejs

<img src="../manuales/Gifs/Logos/vuejs.png" width="500" >

## Despliegue

- Docker

<img src="../manuales/Gifs/Logos/docker.png" width="350" >


- Kubernetes

<img src="../manuales/Gifs/Logos/kubernetes.png" width="350" >

- Helm

<img src="../manuales/Gifs/Logos/helm.png" width="350" >


## DevOps Tools

- Terraform **(infraestructura)**

<img src="../manuales/Gifs/Logos/terraform.png" width="350" >


- Circle Ci **(CI/CD Pipeline)**

<img src="../manuales/Gifs/Logos/circleci.png" width="350" >


- Prometheus **(monitoreo)**

<img src="../manuales/Gifs/Logos/prometheus.png" width="350" >


- Grafana **(monitoreo)**

<img src="../manuales/Gifs/Logos/grafana.png" width="350" >


## Cloud Provider

<img src="../manuales/Gifs/Logos/googlecloud.png" width="350" >



