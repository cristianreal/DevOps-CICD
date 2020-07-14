<template>
	<div class="container">
		<h1 align="center" class="display-3">Listar Vendedores</h1>
		<!-- LIMIT CREATE -->
		<hr>
			<p class="error" v-if="error">{{error}}</p>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
                        <th scope="col">Nombre</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Email</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Jornada</th>
                        <th scope="col">Opciones</th>
                    </tr>
				</thead>
				<tbody>
					<tr class="table-primary" v-for="(post, index) in posts" 
                        v-bind:item="post" 
                        v-bind:index="index" 
                        v-bind:key="post.pk_vendedor" >
						<td> {{post.nombre }} {{post.apellido }}</td>
                        <td> {{post.telefono }}</td>
                        <td> {{post.email }}</td>
                        <td> {{post.direccion }}</td>
                        <td  v-if="post.jornada == 1"> Matutina </td>
                        <td  v-else> Vespertina </td>
						<td>
							<router-link :to="'/vendedor/detalle/' + post.pk_vendedor" class="btn btn-success"  >Detalle</router-link>
							<router-link :to="'/vendedor/editar/' + post.pk_vendedor" class="btn btn-info"  >Editar</router-link>
							<a class="btn btn-warning" @click="deletePost(post.pk_vendedor)"  >Eliminar</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</template>

<script>
import axios from 'axios';
const _PATH = "/api/vendedores/";

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