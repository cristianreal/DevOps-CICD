# Archivos de kubernetes
- [deployment-nginx.yml](#deployment-nginx.yml)
- [service-nginx.yml](#service-nginx.yml)
- [service-ingress.yml](#service-ingress.yml)

# Conceptos generales:
* [POD](#POD)
* [ReplicaSet](#replicaset)
* [Deployment](#deployment)
* [Service](#service)

Kubernetes es una herramienta para la orquestacion de contenedores, sin embargo, no trabaja con contenedores como tal. La unidad minima de ejecucion en kubernetes es un **pod**, y dentro de un pod se pueden correr uno o varios contenedores (aunque se recomienda que sea solo uno).

Sin embargo los pod, son entornos descartables. Estos nacen y mueren, no se pueden resucitar o reiniciar. Si se pierde un pod, entonces se pierde para siempre y se levanta uno completamente nuevo pero funciona igual.

Para que esto pueda ser posibles se utilizan abstracciones mas potentes conocidas como deployments.

## POD
Unidad minima de ejecucion en kubernetes

## ReplicaSet
Abstraccion a la cual al definirla se le indica la cantidad de replicas de un microservicio y se encarga de velar porque esta cantidad se cumpla en todo momoento. Esta es la abstraccion mas basica, pero carece de metodos para actualizar los pod sin quedar fuera de servicio.

## Deployment
Abstraccion que crea y maneja por su cuenta replicaset. Tiene metodos para actualizar los contenedores sin tener tiempos fuera de servicio, a estos metodos se le conoce como metodos de rolling update. Hay diversas formas de realizar un rolling updad, una de ellas es que se va disminuyendo la cantidad de pods del replicaset anterior al mismo ritmo que va aumentando la cantidad de pods de un replica set completamente nuevo que maneja los pods actualizados.

## Service
En kubernetes con un deployment se puede configurar muchos pods del mismo tipo, sin embargo, dada la naturaleza descartable de los pods se necesita de una manera para poder agrupar los pods del mismo tipo y aplicarles reglas de red para servir las peticiones recibidas del usuario.

Es importante entender el concepto de **labels** que son quienes identifican a los objetos de kubernetes (pods, deploymentes, services, replicaset, etc), y su contraparte **selectors** que son quienes definen a que labels se le aplica un objeto.

Hay diferentes tipos de servicios, algunos de ellos son:
* **ClusterIP**: Este servicio es para poder acceder a un conjunto de pods pero solamente dentro del mismo cluster.
* **NodePort**: Permite acceder a un servicio de manera externa utilizando la ip de uno de los nodos del cluster y un puerto que asigna kubernetes.
* **LoadBalancer**: Este load balancer crea un servicio de tipo load balancer en el proveedor de servicios de la nube.
* **Ingress**: Establece un cojunto de rutas disponibles en un ingress controller para redirigirlas a otros servicios.

# deployment-nginx.yml
Observaciones: la parte de template es la que define la informacion del pod.
El selector que esta sobre ese template es el cual va a aplicar el replicaset para asegurarse que siempre se tenga la cantidad indicada de pods.
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-nginx
spec:
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx-container
        image: christianreal/ejemplo-ci-cd
        ports:
        - containerPort: 80
```
# service-nginx.yml
Observaciones: En este servicio es un clusterip que permite comunicarse con un conjunto de pods similares, se va a aplicar a traves de un selector buscando entre todos los pods los que tengan el label *app: nginx*. Al omitir el type es de ClusterIP por defecto.
```
apiVersion: v1
kind: Service
metadata:
  name: service-nginx
spec:
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
```
# service-ingress.yml
Para tener solo un punto de entrada se configura un ingress, entonces a traves de un path se puede acceder a diferentes servicios. En este caso se redirecciona a service-nginx para tener solamente un punto de entrada publico. El ingress conigura un reverse proxy y un load balancer automaticamente.
```
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: ingress-principal
  annotations:
    kubernetes.io/ingress.class: "nginx"
spec:
  rules:
  - http:
      paths:
      - path: /
        backend:
          serviceName: service-nginx
          servicePort: 80
```