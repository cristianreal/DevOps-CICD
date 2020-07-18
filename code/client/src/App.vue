<template>
  <div id="app">
    <NavBar/>
    <div class="container">  
        <router-link v-if="authenticated" to="/login" v-on:click.native="logout()" replace>Logout</router-link>
        <router-view @authenticated="setAuthenticated" />
    </div>
  </div>
</template>
<script>
import NavBar from './components/NavBar.vue'

export default {
  name: 'app',
  components: {
    NavBar
  },
      data() {
            return {
                authenticated: false
            }
        },
    mounted() {
            if(!this.authenticated) {
                this.$router.replace({ name: "login" });
            }
        },
        methods: {
            setAuthenticated(status) {
                this.authenticated = status;
            },
            logout() {
                this.authenticated = false;
            }
        }
}
</script>
<style>
#Contenido {
  margin-top: 15px;
}
</style>