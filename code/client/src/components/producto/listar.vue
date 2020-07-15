<template>
	<div class="container">
		<h1 align="center" class="display-3">Listar Productos</h1>
		<!-- LIMIT CREATE -->
		<hr>
			<p class="error" v-if="error">{{error}}</p>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th scope="col">Nombre</th>
						<th scope="col">Descripcion</th>
						<th scope="col">Precio</th>
						<th scope="col">Marca</th>
						<th scope="col">Opciones</th>
					</tr>
				</thead>
				<tbody>
					<tr class="table-primary" v-for="(post, index) in posts" 
                        v-bind:item="post" 
                        v-bind:index="index" 
                        v-bind:key="post.pk_producto" >
						<td> {{post.nombre}} </td>
						<td> {{post.descripcion}} </td>
						<td> {{post.precio}} </td>
						<td> {{post.Marca}} </td>
						<td>
							<router-link :to="'/producto/detalle/' + post.pk_producto" class="btn btn-success"  >Editar</router-link>
							<router-link :to="'/producto/editar/' + post.pk_producto" class="btn btn-info"  >Editar</router-link>
							<a class="btn btn-warning" @click="deletePost(post.pk_producto)"  >Eliminar</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</template>

<script>
import axios from 'axios';
const _PATH = "/api/productos/";

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