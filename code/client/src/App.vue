<template>
  <div id="app">
    <NavBar/>
    
  </div>
</template>
<script>
import NavBar from './components/NavBar.vue'

export default {
  name: 'app',
  components: {
    NavBar
  }, 
  mounted(){
    console.log("hola")
    console.log(process.env.VUE_APP_TITLE);
    console.log(process.env.VUE_APP_TITLE);
    console.log(process.env.VUE_APP_API_IP);
    console.log(process.env.VUE_APP_API_PORT);
    console.log(process.env.MYVAR2);
  }
}
</script>
<style>
#Contenido {
  margin-top: 15px;
}
</style>