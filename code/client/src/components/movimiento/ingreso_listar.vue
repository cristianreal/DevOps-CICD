<template>
	<div class="container">
		<h1 align="center" class="display-3">Listar Ingresos</h1>
		<!-- LIMIT CREATE -->
		<hr>
			<p class="error" v-if="error">{{error}}</p>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th scope="col">Fecha</th>
						<th scope="col">Vendedor</th>
						<th scope="col">Proveedor</th>
						<th scope="col">Total</th>
						<th scope="col">Opciones</th>
					</tr>
				</thead>
				<tbody>
					<tr class="table-primary" v-for="(post, index) in ingresos" 
                        v-bind:item="post" 
                        v-bind:index="index" 
                        v-bind:key="post.pk_movimiento" >
						<td> {{post.fecha_movimiento}} </td>
						<td> {{post.vendedor}} </td>
						<td> {{post.proveedor}} </td>
						<td> {{post.total}} </td>
						<td>
							<router-link :to="'/movimiento/ingreso/' + post.pk_movimiento" class="btn btn-secondary"  >Detalle</router-link>
							<a class="btn btn-warning" @click="deletePost(post.pk_movimiento)"  >Eliminar</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</template>

<script>
import axios from 'axios';
const _PATH = "/api/movimientos/";

export default {
    name: 'listar',
    data() {
        return {
            ingresos: [],
            error: '',
            text: '',
            url: "http://" + this.$http + ":" + this.$port
        }
    },
    mounted() {
        this.getPosts()
    },
    methods: {

        getPosts() {
            axios.get(this.url+"/ingreso").then(
                result => {
                    this.ingresos = result.data[0]
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