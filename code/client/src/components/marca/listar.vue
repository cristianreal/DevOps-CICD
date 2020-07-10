<template>
  <div class="container">
    <h1> Latest Posts </h1>
    <!-- LIMIT CREATE -->
    <hr>
    <p class="error" v-if="error">{{error}}</p>
    <table class="table table-hover">
  <thead>
    <tr  class="table-secondary">
      <th scope="col">Nombre</th>
    </tr>
  </thead>
  <tbody>
        <tr class="table-primary" v-for="(post, index) in posts" 
        v-bind:item="post" 
        v-bind:index="index" 
        v-bind:key="post.id" 
        @click="deletePost(post.id)">
        <td> {{post.name}} </td>
      </tr>
    </tbody>
</table> 
    
  </div>
</template>

<script>
import axios from 'axios';
//const _IP=process.env.API_IP;
const _IP="34.69.42.189";
//const _PORT=process.env.API_PORT;
const _PORT="5000";
const _PATH = "/api/posts/";

const url = "http://"+ _IP + ":" + _PORT + _PATH
export default {
  name: 'listar',
  data() {
    return {
      posts: [],
      error: '',
      text: ''
    }
  },
  mounted() {
    this.getPosts()
  },
  methods: {

    getPosts(){
      axios.get(url).then(
        result => {
          this.posts = result.data
        }, error => {
          console.error(error)
        }
      )        
    },
    deletePost(id){
      
      axios.delete(`${url}${id}`).then(() => {
        this.getPosts()
      }).catch( (error) => {
        console.error(error)
      })
      
    }
}
};
</script>