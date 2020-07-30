<template>


<div class="container">
   <div class="jumbotron">
      <h1 class="display-3">Bienvenido!</h1>
      <p class="lead">Sistema de almacenamiento, acceso rapido.</p>
      <hr class="my-4">
      <div class="container">

      
        <div class="row">
          <div class="col-sm">
            <div class="card text-light bg-primary mb-3" style="max-width: 20rem;">
              <div class="card-header">Marcas</div>
              <div class="card-body">
                <ul class="list-group">
                      <router-link to="/marca/crear" class="list-group-item list-group-item-action" >Crear</router-link>
                      <router-link to="/marca/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul> 
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-light bg-secondary mb-3" style="max-width: 20rem;">
              <div class="card-header">Productos</div>
              <div class="card-body">
               <ul class="list-group">
                      <router-link to="/producto/crear" class="list-group-item list-group-item-action" >Crear</router-link>
                      <router-link to="/producto/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul>              
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-light bg-info mb-3" style="max-width: 20rem;">
              <div class="card-header">Movimientos</div>
              <div class="card-body">
               <ul class="list-group">
                      <router-link to="/movimiento/ingresos" class="list-group-item list-group-item-action" >Ingresos</router-link>
                      <router-link to="/movimiento/egresos" class="list-group-item list-group-item-action" >Egresos</router-link>
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