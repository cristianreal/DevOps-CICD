# SISTEMA DE ALMACENAMIENTO

# Frontend

## Modulos 
- [Login](#login)
- [Marcas](#marcas)
- [Vendedores](#vendedores)
- [Proveedores](#proveedores)
- [Productos](#productos)
- [Ingresos](#ingresos)
- [Egresos](#egresos)
- [Reportes](#reportes)
- [Logout](#logout)

## Login

![imagen](Gifs/Usuario/Login.gif)

## Marcas

Este modulo permite la creacion de marcas que distribuye la empresa.

### Rutas

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Marca | --- | https://poliformas.com.gt/#/marca/listar | GET | ---
Crear Marca | --- | https://poliformas.com.gt/#/marca/crear | GET  | ---
Detalle Marca  | idMarca | https://poliformas.com.gt/#/marca/detalle/:id | GET | --
Editar Marca | idMarca | https://poliformas.com.gt/#/marca/editar/:id | GET | --


![imagen](Gifs/Usuario/Marca.gif)

## Vendedores

Este modulo permite llevar el control de los vendedores/empleados que trabajana en la empresa.

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Vendedor | --- | https://poliformas.com.gt/#/vendedor/listar | GET | ---
Crear Vendedor | --- | https://poliformas.com.gt/#/vendedor/crear | GET  | ---
Detalle Vendedor  | idVendedor | https://poliformas.com.gt/#/vendedor/detalle/:id | GET | --
Editar Vendedor | idVendedor | https://poliformas.com.gt/#/vendedor/editar/:id | GET | --

![imagen](Gifs/Usuario/Vendedor.gif)


## Proveedores

Este modulo permite llevar el registro de los proveedores que abastecen de productos a la empresa.

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Proveedor | --- | https://poliformas.com.gt/#/proveedor/listar | GET | ---
Crear Proveedor | --- | https://poliformas.com.gt/#/proveedor/crear | GET  | ---
Detalle Proveedor  | idProveedor | https://poliformas.com.gt/#/proveedor/detalle/:id | GET | --
Editar Proveedor | idProveedor | https://poliformas.com.gt/#/proveedor/editar/:id | GET | --

![imagen](Gifs/Usuario/Proveedor.gif)

## Productos

Este modulo permite llevar el registro de los productos que la empresa distribuye.

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Producto | --- | https://poliformas.com.gt/#/producto/listar | GET | ---
Crear Producto | --- | https://poliformas.com.gt/#/producto/crear | GET  | ---
Detalle Producto  | idProducto | https://poliformas.com.gt/#/producto/detalle/:id | GET | --
Editar Producto | idProducto | https://poliformas.com.gt/#/producto/editar/:id | GET | --

![imagen](Gifs/Usuario/Producto.gif)

### Detalle de producto

![imagen](Gifs/Usuario/Producto2.gif)

## Ingresos

Este modulo permite crear un movimiento de ingreso para agregar existencias de ciertos productos al inventario.

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Ingreso | --- | https://poliformas.com.gt/#/movimiento/ingreso/listar | GET | ---
Crear Ingreso | --- | https://poliformas.com.gt/#/movimiento/ingreso/ | GET  | ---
Detalle Ingreso | idIngreso | https://poliformas.com.gt/#/movimiento/ingreso/detalle/:id | GET | --

![imagen](Gifs/Usuario/Ingreso.gif)

## Egresos

Este modulo permite crear un movimiento de ingreso para restar las existencias de ciertos productos al inventario.

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Egresos | --- | https://poliformas.com.gt/#/movimiento/egreso/listar | GET | ---
Crear Egreso | --- | https://poliformas.com.gt/#/movimiento/egreso/ | GET  | ---
Detalle Egreso | idIngreso | https://poliformas.com.gt/#/movimiento/egreso/detalle/:id | GET | --

![imagen](Gifs/Usuario/Egreso.gif)

## Reportes

Este modulo permite ver reportes.

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Menu Reportes | --- | https://poliformas.com.gt/#/reportes/menu | GET | ---
Reporte 1 | --- | https://poliformas.com.gt/#/reportes/reporte1 | GET | ---
Reporte 2 | limiteExistencia | https://poliformas.com.gt/#/reportes/reporte2/:limiteExistencia | GET  | ---
Reporte 3 | cantidadMeses | https://poliformas.com.gt/#/reportes/reporte3/:cantidadMeses | GET | --
Reporte 4 | cantidadMeses | https://poliformas.com.gt/#/reportes/reporte4/:cantidadMeses | GET | --

### Reporte 1

![imagen](Gifs/Usuario/Reporte1.gif)

### Reporte 2

![imagen](Gifs/Usuario/Reporte2.gif)

### Reporte 3

![imagen](Gifs/Usuario/Reporte3.gif)

### Reporte 4

![imagen](Gifs/Usuario/Reporte4.gif)

## Logout

![imagen](Gifs/Usuario/Logout.gif)

# APIs microservicios Backend

## Marcas

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Marca | --- | https://backend.poliformas.com.gt/api/marcas | GET | ---
Crear Marca | --- | https://backend.poliformas.com.gt/api/marcas | POST  |  { name, country, webpage }
Detalle Marca  | idMarca | https://backend.poliformas.com.gt/api/marcas/:id | GET | --
Editar Marca | idMarca | https://backend.poliformas.com.gt/api/marcas/:id | PUT |  { name, country, webpage }
Eliminar Marca | idMarca | https://backend.poliformas.com.gt/api/marcas/:id | DELETE | --


## Productos

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Productos | --- | https://backend.poliformas.com.gt/api/productos | GET | ---
Crear Productos | --- | https://backend.poliformas.com.gt/api/productos | POST  |  { nombre, descripcion, precio, marca }
Detalle Productos  | idProductos | https://backend.poliformas.com.gt/api/productos/:id | GET | --
Editar Productos | idProductos | https://backend.poliformas.com.gt/api/productos/:id | PUT |  { nombre, descripcion, precio, marca }
Eliminar Productos | idProductos | https://backend.poliformas.com.gt/api/productos/:id | DELETE | --

## Proveedores

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Proveedor | --- | https://backend.poliformas.com.gt/api/proveedores | GET | ---
Crear Proveedor | --- | https://backend.poliformas.com.gt/api/proveedores | POST  |  { nombre, apellido, direccion, telefono, email, pagina_web, pais, ciudad }
Detalle Proveedor  | idProveedores | https://backend.poliformas.com.gt/api/proveedores/:id | GET | --
Editar Proveedor | idProveedores | https://backend.poliformas.com.gt/api/proveedores/:id | PUT |  { nombre, apellido, direccion, telefono, email, pagina_web, pais, ciudad }
Eliminar Proveedor | idProveedores | https://backend.poliformas.com.gt/api/proveedores/:id | DELETE | --

## Vendedores

Accion | Parametros | Ruta | Method | Body
--- | --- | --- | --- | --- | 
Listar Vendedor | --- | https://backend.poliformas.com.gt/api/vendedores | GET | ---
Crear Vendedor | --- | https://backend.poliformas.com.gt/api/vendedores | POST  |  { nombre, apellido, direccion, telefono, email, genero, fecha_nacimiento, fecha_vinculacion, jornada, pass }
Detalle Vendedor  | idVendedores | https://backend.poliformas.com.gt/api/vendedores/:id | GET | --
Editar Vendedor | idVendedores | https://backend.poliformas.com.gt/api/vendedores/:id | PUT |  { nombre, apellido, direccion, telefono, email, jornada }
Eliminar Vendedor | idVendedores | https://backend.poliformas.com.gt/api/vendedores/:id | DELETE | --