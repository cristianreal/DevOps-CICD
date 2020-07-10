<template>
  <div class="container">
    <div v-if="testButClicked" class="alert alert-success" role="alert">
            {{elemento}} Guardado
        </div>

        <div class="jumbotron">
            <h3 align="center" class="display-4">Crear Marca</h3>
            <hr class="my-1">
            <div class="form-group">
                <label class="col-form-label" for="namebrand">Nombre de marca</label>
                <input type="text" class="form-control" placeholder="Ingrese el nombre de la marca" v-model="namebrand" id="namebrand" name="namebrand">
            </div>

            <div class="form-group">
                <label class="col-form-label" for="country">Pais de origen</label>
                <input type="text" class="form-control" placeholder="Ingrese el pais de origen" id="country" name="country">
            </div>

            <div class="form-group">
                <label class="col-form-label" for="webpage">Pagina web</label>
                <input type="text" class="form-control" placeholder="Ingrese la pagina oficial de la marca" id="webpage" name="webpage">
            </div>

            <button v-on:click="createPost">Post!</button>
</div>   
  </div>
</template>
<script>
import axios from 'axios';
const _IP="34.69.42.189";
const _PORT="5000";
const _PATH = "/api/posts/";
const url = "http://"+ _IP + ":" + _PORT + _PATH

export default {
  name: 'crear',
  data() {
    return {
      error: '',
      text: '',
      elemento: '',
      testButClicked: false
    }
  },
  methods: {
      testToast() {
      this.testButClicked = true;
    },
    createPost(){
     this.elemento = this.namebrand
      axios.post(url, { name: this.namebrand}).then(() => {
        this.namebrand = ''
        this.getPosts()
      }).catch( (error) => {
        console.error(error)
        return;
      })
      this.testToast()
    }
},
     watch:{
    testButClicked(val){
      if (val){
        setTimeout(()=>this.testButClicked=false,1000);
      }
    }
  }
};

</script>