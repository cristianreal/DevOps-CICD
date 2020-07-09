<template>
  <div class="container">
    <h1> Latest Posts </h1>
    <!-- CREATE POST -->
    <div class="create-post">
      <label for="create-post">Say Something...</label>
      <input type="text" id="create-post" v-model="text" placeholder="Add name"/>
      <button v-on:click="createPost">Post!</button>
    </div>
    <!-- LIMIT CREATE -->
    <hr>
    <p class="error" v-if="error">{{error}}</p>
    <div class="posts-container">
      <div class="post" v-for="(post, index) in posts" 
        v-bind:item="post" 
        v-bind:index="index" 
        v-bind:key="post.id" 
        @click="deletePost(post.id)">
      <p class="text"> {{post.name}} </p>
      </div>
    </div>
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
  name: 'PostComponent',
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

    createPost(){
      axios.post(url, { name: this.text}).then(() => {
        this.text = ''
        this.getPosts()
      }).catch( (error) => {
        console.error(error)
      })
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.container {
  max-width: 800px;
  margin: 0 auto;
}

p.error {
  border: 1px solid #ff5b5f;
  background-color: #ffc5c1;
  padding:  10px;
  margin-bottom: 15px;
}

div.post {
  position: relative;
  border: 1px solid #5bd658;
  background-color:  #bcffb8;
  padding: 10px 10px 30px 10px;
  margin-bottom: 15px;
}

div.created-at {
  position: absolute;
  top: 0;
  left: 0;
  padding: 5px 15px 5px 15px;
  background-color: darkgreen;
  color: white;
  font-size: 13px;
}

p.text {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 0;
}
</style>
