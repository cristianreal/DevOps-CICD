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
  data() {
    return {
      x1: Math.ceil(Math.random() * 100), 
      x2: Math.ceil(Math.random() * 100),
      guess: "",
      message: ""
    }
  }
}
</script>
<style>
#Contenido {
  margin-top: 15px;
}
</style>