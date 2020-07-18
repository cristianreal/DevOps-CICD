 <template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-solar">
        <router-link to="/" class="navbar-brand"  >Sistema de Almacenamiento</router-link>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id= "navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Marcas</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/marca/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/marca/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Vendedores</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/vendedor/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/vendedor/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Proveedores</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/proveedor/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/proveedor/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Productos</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/producto/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/producto/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Ingresos</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/movimiento/ingreso" class="dropdown-item" >Registrar</router-link>
                        <router-link to="/movimiento/ingreso/listar" class="dropdown-item" >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Egresos</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/movimiento/egreso" class="dropdown-item" >Registrar</router-link>
                        <router-link to="/movimiento/egreso/listar" class="dropdown-item" >Listar</router-link>
                        <router-link to="/login" v-on:click="logout()" >Logout</router-link>                    
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</template>
<script>

export default {
  name: 'navbar',
  data() {
            return {
                authenticated: false
            }
  },
  mounted() {
          /*  if(!this.authenticated) {
                this.$router.replace({ name: "login" });
            }*/
    },
     methods: {
            setAuthenticated(status) {
                this.authenticated = status;
            },
            logout() {
                this.authenticated = false;
                localStorage.setItem('user',null)
                console.log("Fuera");
            }
        }
}
</script>