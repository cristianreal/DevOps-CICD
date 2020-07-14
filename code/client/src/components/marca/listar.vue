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
                        v-bind:key="post.pk_marca" >
						<td> {{post.nombre}} </td>
						<td> {{post.pagina_web}} </td>
						<td> {{post.pais}} </td>
						<td>
							<router-link :to="'/marca/detalle/' + post.pk_marca" class="btn btn-success"  >Editar</router-link>
							<router-link :to="'/marca/editar/' + post.pk_marca" class="btn btn-info"  >Editar</router-link>
							<a class="btn btn-warning" @click="deletePost(post.pk_marca)"  >Eliminar</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</template>

<script>
import axios from 'axios';
const _PATH = "/api/marcas/";

export default {
    name: 'listar',
    data() {
        return {
            posts: [],
            error: '',
            text: '',
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.getPosts()
    },
    methods: {

        getPosts() {
            axios.get(this.url).then(
                result => {
                    this.posts = result.data[0]
                }, error => {
                    console.error(error)
                }
            )
        },
        deletePost(id) {

            axios.delete(`${this.url}${id}`).then(() => {
                this.getPosts()
            }).catch((error) => {
                console.error(error)
            })

        }
    }
};
</script>