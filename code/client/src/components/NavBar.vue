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
            <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="collapse" data-target="#collapse-marca" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Marcas</a>
                    <div class="collapse" id="collapse-marca">
                        <router-link to="/marca/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/marca/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="collapse" data-target="#collapse-Vendedores" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Vendedores</a>
                    <div class="collapse" id="collapse-Vendedores">
                        <router-link to="/vendedor/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/vendedor/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="collapse" data-target="#collapse-Proveedores" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Proveedores</a>
                    <div class="collapse" id="collapse-Proveedores">
                        <router-link to="/proveedor/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/proveedor/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="collapse" data-target="#collapse-Productos" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Productos</a>
                    <div class="collapse" id="collapse-Productos">
                        <router-link to="/producto/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/producto/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="collapse" data-target="#collapse-Ingresos" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Ingresos</a>
                    <div class="collapse" id="collapse-Ingresos">
                        <router-link to="/movimiento/ingreso" class="dropdown-item" >Registrar</router-link>
                        <router-link to="/movimiento/ingreso/listar" class="dropdown-item" >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="collapse" data-target="#collapse-Egresos" role="button" aria-haspopup="true" aria-expanded="false" aria-controls="collapseExample">Egresos</a>
                    <div class="collapse" id="collapse-Egresos">
                        <router-link to="/movimiento/egreso" class="dropdown-item" >Registrar</router-link>
                        <router-link to="/movimiento/egreso/listar" class="dropdown-item" >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item">
                    <router-link to="/reportes/menu" class="nav-link" >Reportes</router-link>
                </li>
            </ul>
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