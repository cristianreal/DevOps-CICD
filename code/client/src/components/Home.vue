<template>


<div class="container">
   <div class="jumbotron">
      <h1 class="display-3">Bienvenido!</h1>
      <p class="lead">Sistema de almacenamiento, acceso rapido.</p>
      <hr class="my-4">
      <div class="container">

      
        <div class="row">
          <div class="col-sm">
            <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
              <div class="card-header">Marcas</div>
              <div class="card-body">
                <ul class="list-group">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                   Crear
                      <router-link to="/marca/crear" class="badge badge-secondary badge-pill" >Visitar</router-link>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Listar
                      <router-link to="/marca/listar" class="badge badge-secondary badge-pill" >Visitar</router-link>
                  </li>
                </ul> 
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-secondary mb-3" style="max-width: 20rem;">
              <div class="card-header">Productos</div>
              <div class="card-body">
               <ul class="list-group">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Crear
                      <router-link to="/producto/crear" class="badge badge-primary badge-pill" >Visitar</router-link>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Listar
                      <router-link to="/producto/listar" class="badge badge-primary badge-pill" >Visitar</router-link>
                  </li>
                </ul>              
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-info mb-3" style="max-width: 20rem;">
              <div class="card-header">Movimientos</div>
              <div class="card-body">
               <ul class="list-group">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Ingresos
                      <router-link to="/movimiento/ingresos" class="badge badge-primary badge-pill" >Visitar</router-link>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    Egresos
                      <router-link to="/movimiento/egresos" class="badge badge-primary badge-pill" >Visitar</router-link>
                  </li>
                </ul> 
              </div>
            </div>
          </div>
        </div>
      </div>
   </div>
</div>
</template>
<script>

export default {
  name: 'home'
}
</script>