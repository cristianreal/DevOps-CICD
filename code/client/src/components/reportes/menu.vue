<template>


<div class="container">
   <div class="jumbotron">
      <h1 class="display-3">Reportes</h1>
      <hr class="my-4">
      <div class="container">

      
      <!-- First Row -->
        <div class="row">
          <div class="col-sm">
            <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">article</i> Reporte 1 </div>
              <div class="card-body">
                <p class="card-text"> Reporte de los productos sin existencia actualmente.</p>
                <ul class="list-group">
                      <router-link to="/reportes/reporte1" class="list-group-item list-group-item-action" >Visitar</router-link>
                </ul> 
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-dark mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">article</i> Reporte 2 </div>
              <div class="card-body">
               <p class="card-text"> Reporte de los productos con menos de 50 unidades en existencia.</p>
                <ul class="list-group">
                      <router-link to="/reportes/reporte2/50" class="list-group-item list-group-item-action" >Visitar</router-link>
                </ul>           
              </div>
            </div>
          </div>
          <div class="col-sm">
            <div class="card text-white bg-info mb-3" style="max-width: 20rem;">
              <div class="card-header"><i class="material-icons white-text">article</i> Reporte 3 </div>
              <div class="card-body">
               <p class="card-text"> Reporte de productos sin ventas en los ultimos 2 meses.</p>
                <ul class="list-group">
                      <router-link to="/reportes/reporte3/2" class="list-group-item list-group-item-action" >Visitar</router-link>
                </ul> 
              </div>
            </div>
          </div>
        </div>
      <!-- Second Row -->
        <div class="row">
          <div class="col-sm">
            <div class="card text-white bg-success mb-3" style="max-width: 20rem;">
              <div class="card-header"> <i class="material-icons white-text">article</i> Reporte 4 </div>
              <div class="card-body">
                <p class="card-text"> Top 10 de productos con mas ventas en los 2 ultimos meses.</p>
                <ul class="list-group">
                      <router-link to="/reportes/reporte4/2" class="list-group-item list-group-item-action" >Visitar</router-link>
                </ul> 
              </div>
            </div>
          </div>
          <div class="col-sm">
          </div>
          <div class="col-sm">
          </div>
        </div>
      </div>
   </div>
</div>
</template>
<script>

export default {
  name: 'menu'
}
</script>