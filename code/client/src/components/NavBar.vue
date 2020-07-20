 <template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-solar">
        <router-link to="/" class="navbar-brand"  >Sistema de Almacenamiento</router-link>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" v-if="authenticated" id= "navbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Marcas</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/marca/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/marca/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Vendedores</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/vendedor/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/vendedor/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown" v-if="administrador">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Proveedores</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/proveedor/crear" class="dropdown-item"  >Crear</router-link>
                        <router-link to="/proveedor/listar" class="dropdown-item"  >Listar</router-link>
                    </div>
                </li>
                <li class="nav-item dropdown" v-if="administrador">
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
                <li class="nav-item dropdown" v-if="authenticated">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Egresos</a>
                    <div class="dropdown-menu" style="">
                        <router-link to="/movimiento/egreso" class="dropdown-item" >Registrar</router-link>
                        <router-link to="/movimiento/egreso/listar" class="dropdown-item" >Listar</router-link>
                    </div>
                </li>
            </ul>
        </div>

        <div class="form-inline my-2 my-lg-0">
            <router-link to="/login" class="dropdown-item" v-on:click.native="logout()" >Logout</router-link>                    
        </div>
    </nav>
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