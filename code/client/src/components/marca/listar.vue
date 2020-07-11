<template>
	<div class="container">
		<h1 align="center" class="display-3">Listar Marcas</h1>
		<!-- LIMIT CREATE -->
		<hr>
			<p class="error" v-if="error">{{error}}</p>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th scope="col">Nombre</th>
						<th scope="col">Pais</th>
						<th scope="col">Web Page</th>
						<th scope="col">Opciones</th>
					</tr>
				</thead>
				<tbody>
					<tr class="table-primary" v-for="(post, index) in posts" 
        v-bind:item="post" 
        v-bind:index="index" 
        v-bind:key="post.id" >
						<td> {{post.nombre}} </td>
						<td> {{post.pagina_web}} </td>
						<td> {{post.pais}} </td>
						<td>
							<router-link to="/marca/editar/{{post.name}}" class="btn btn-info"  >Editar</router-link>
							<a class="btn btn-warning" @click="deletePost(post.pk_marca)"  >Eliminar</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</template>

<script>
import axios from 'axios';
//const _IP=process.env.API_IP;
//const _IP="34.69.42.189";
const _IP = "127.0.0.1";
//const _PORT=process.env.API_PORT;
const _PORT = "5000";
const _PATH = "/api/marcas/";

const url = "http://" + _IP + ":" + _PORT + _PATH
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

        getPosts() {
          console.log(process.env);
            axios.get(url).then(
                result => {
                    this.posts = result.data[0]
                }, error => {
                    console.error(error)
                }
            )
        },
        deletePost(id) {

            axios.delete(`${url}${id}`).then(() => {
                this.getPosts()
            }).catch((error) => {
                console.error(error)
            })

        }
    }
};
</script>