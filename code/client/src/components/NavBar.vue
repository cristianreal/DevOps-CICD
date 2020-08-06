<template>
   <div>
      <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
         <router-link to="/" class="navbar-brand col-sm-3 col-md-2 mr-0"  >Sistema de Almacenamiento</router-link>
         <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
               <router-link to="/login" class="nav-link" v-on:click.native="logout()" v-if="authenticated">Sign out</router-link>
            </li>
         </ul>
      </nav>
      <div class="container-fluid" >
         <div class="row">
            <nav class="navbar navbar-expand-sm  col-md-2 d-none d-md-block bg-light sidebar" v-if="authenticated">
               <div class="sidebar-sticky">
                  <ul class="nav flex-column">
                     <li class="nav-item">
                        <a class="nav-link active" href="#">
                        <span data-feather="home"></span>
                        Dashboard <span class="sr-only">(current)</span>
                        </a>
                     </li>
                  </ul>
                  <div v-if="administrador">
                     <!-- Marcas -->
                     <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <a class="span" data-toggle="collapse" data-target="#collapse-marcas" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Marcas</a>
                        <div class="d-flex align-items-center text-muted" >
                        <span class="material-icons">local_offer</span>
                        </div>
                     </h6>
                     <div class="collapse" id="collapse-marcas">
                        <ul class="nav flex-column mb-2">
                           <li class="nav-item">
                              <router-link to="/marca/crear" class="nav-link"  >Crear</router-link>
                           </li>
                           <li class="nav-item">
                              <router-link to="/marca/listar" class="nav-link"  >Listar</router-link>
                           </li>
                        </ul>
                     </div>
                     <!-- Vendedores -->
                     <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <a class="span" data-toggle="collapse" data-target="#collapse-vendedores" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Vendedores</a>
                        <div class="d-flex align-items-center text-muted">
                        <span class="material-icons">supervisor_account</span>
                        </div>
                     </h6>
                     <div class="collapse" id="collapse-vendedores">
                        <ul class="nav flex-column mb-2">
                           <li class="nav-item">
                              <router-link to="/vendedor/crear" class="nav-link"  >Crear</router-link>
                           </li>
                           <li class="nav-item">
                              <router-link to="/vendedor/listar" class="nav-link"  >Listar</router-link>
                           </li>
                        </ul>
                     </div>
                     <!-- Proveedores -->
                     <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <a class="span" data-toggle="collapse" data-target="#collapse-proveedores" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Proveedores</a>
                        <div class="d-flex align-items-center text-muted">
                        <span class="material-icons">supervised_user_circle</span>
                        </div>
                     </h6>
                     <div class="collapse" id="collapse-proveedores">
                        <ul class="nav flex-column mb-2">
                           <li class="nav-item">
                              <router-link to="/proveedor/crear" class="nav-link"  >Crear</router-link>
                           </li>
                           <li class="nav-item">
                              <router-link to="/proveedor/listar" class="nav-link"  >Listar</router-link>
                           </li>
                        </ul>
                     </div>
                     <!-- Productos -->
                     <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <a class="span" data-toggle="collapse" data-target="#collapse-productos" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Productos</a>
                        <div class="d-flex align-items-center text-muted">
                        <span class="material-icons">category</span>
                        </div>
                     </h6>
                     <div class="collapse" id="collapse-productos">
                        <ul class="nav flex-column mb-2">
                           <li class="nav-item">
                              <router-link to="/producto/crear" class="nav-link"  >Crear</router-link>
                           </li>
                           <li class="nav-item">
                              <router-link to="/producto/listar" class="nav-link"  >Listar</router-link>
                           </li>
                        </ul>
                     </div>
                     <!-- Reportes -->
                     <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <router-link to="/reportes/menu" class="span" role="button" aria-haspopup="true" aria-expanded="false">Reportes</router-link>
                        <div class="d-flex align-items-center text-muted">
                        <span class="material-icons">analytics</span>
                        </div>
                     </h6>
                  </div>
                  <!--    No admin -->
                  <!-- Ingresos -->
                  <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                     <a class="span" data-toggle="collapse" data-target="#collapse-ingresos" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Ingresos</a>
                     <div class="d-flex align-items-center text-muted" >
                     <span class="material-icons">compare_arrows</span>
                     </div>
                  </h6>
                  <div class="collapse" id="collapse-ingresos">
                     <ul class="nav flex-column mb-2">
                        <li class="nav-item">
                           <router-link to="/movimiento/ingreso" class="nav-link" >Registrar</router-link>
                        </li>
                        <li class="nav-item">
                           <router-link to="/movimiento/ingreso/listar" class="nav-link" >Listar</router-link>
                        </li>
                     </ul>
                  </div>
                  <!-- Egresos -->
                  <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                     <a class="span" data-toggle="collapse" data-target="#collapse-egresos" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Egresos</a>
                     <div class="d-flex align-items-center text-muted">
                     <span class="material-icons">compare_arrows</span>
                     </div>
                  </h6>
                  <div class="collapse" id="collapse-egresos">
                     <ul class="nav flex-column mb-2">
                        <li class="nav-item">
                           <router-link to="/movimiento/egreso" class="nav-link" >Registrar</router-link>
                        </li>
                        <li class="nav-item">
                           <router-link to="/movimiento/egreso/listar" class="nav-link" >Listar</router-link>
                        </li>
                     </ul>
                  </div>
               </div>
            </nav>
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
               <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                  <router-view></router-view>
               </div>
            </main>
         </div>
      </div>
   </div>
</template>

<script>

export default {
  name: 'navbar',
    data: function () {
        return {
            authenticated: false,
            administrador: false
        }
    },
    mounted() {
            if (localStorage.getItem('user') != null){
                this.authenticated = true;
                let usuario = JSON.parse(localStorage.getItem('user'));
                let nombre = usuario.nombre;
                if(nombre == "ADMIN"){
                    this.administrador = true;
                }
                this.$emit('refresh')
            }
    },
     methods: {
            logout() {
                this.authenticated = false;
                localStorage.removeItem('user');
                this.$emit('loggedIn',false)
                this.$emit('eventoautenticar');
                this.$router.push('/login').catch(()=>{});
                this.$emit('refresh')
                this.$emit('verificarautenticado');
                this.$router.go()
            }
        }
}
</script>
<style>
  @import '../assets/dashboard.css';
</style>