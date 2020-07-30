<template>


<div class="container">
   <div class="jumbotron">
      <h1 class="display-3">Bienvenido!</h1>
      <p class="lead">Sistema de almacenamiento, acceso rapido.</p>
      <hr class="my-4">
      <div class="container">

      
      <!-- First Row -->
        <div class="row">
          <div class="col-sm">
            <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">local_offer</i> Marcas</div>
              <div class="card-body">
                <ul class="list-group">
                      <router-link to="/marca/crear" class="list-group-item list-group-item-action" >Crear</router-link>
                      <router-link to="/marca/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul> 
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-dark mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">category</i> Productos</div>
              <div class="card-body">
               <ul class="list-group">
                      <router-link to="/producto/crear" class="list-group-item list-group-item-action" >Crear</router-link>
                      <router-link to="/producto/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul>              
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-info mb-3" style="max-width: 20rem;">
              <div class="card-header"><i class="material-icons white-text">compare_arrows</i>Ingreso</div>
              <div class="card-body">
               <ul class="list-group">
                      <router-link to="/movimiento/ingreso/" class="list-group-item list-group-item-action" >Registrar</router-link>
                      <router-link to="/movimiento/ingreso/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul> 
              </div>
            </div>
          </div>
        </div>
      <!-- Second Row -->
        <div class="row">
          <div class="col-sm">
            <div class="card text-white bg-success mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">supervised_user_circle</i> Proveedores </div>
              <div class="card-body">
                <ul class="list-group">
                      <router-link to="/proveedor/crear" class="list-group-item list-group-item-action" >Crear</router-link>
                      <router-link to="/proveedor/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul> 
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-warning mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">supervisor_account</i> Vendedores </div>
              <div class="card-body">
               <ul class="list-group">
                      <router-link to="/vendedor/crear" class="list-group-item list-group-item-action" >Crear</router-link>
                      <router-link to="/vendedor/listar" class="list-group-item list-group-item-action" >Listar</router-link>
                </ul>              
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-danger mb-3" style="max-width: 20rem;">
              <div class="card-header"><i class="material-icons white-text">compare_arrows</i>Egresos</div>
              <div class="card-body">
               <ul class="list-group">
                      <router-link to="/movimiento/egreso/" class="list-group-item list-group-item-action" >Registrar</router-link>
                      <router-link to="/movimiento/egreso/listar" class="list-group-item list-group-item-action" >Listar</router-link>
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