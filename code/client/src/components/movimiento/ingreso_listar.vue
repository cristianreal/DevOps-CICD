

<template>
   <div class="container">
      <datatable
         title="Listado de Ingresos"
         :columns="tableColumns1"
         :rows="posts"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/movimiento/ingreso/detalle/' + props.row.pk_movimiento" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
               <button class="btn red darken-2 waves-effect waves-light compact-btn"
                  @click="(e) => deletePost(props.row.pk_movimiento, e)">
               <i class="material-icons white-text">delete</i>
               </button>
            </td>
         </template>
      </datatable>
   </div>
</template>

<script>


import axios from 'axios';
const _PATH = "/api/movimientos/";

export default {
	name: 'listar',
	data() {
		return {
			posts: [],
			url: "http://" + this.$http + ":" + this.$port + _PATH,
			tableColumns1: [{
					label: "Id",
					field: "pk_movimiento",
					numeric: true,
					html: false
				},
				{
					label: "Fecha",
					field: "fecha_movimiento",
					numeric: false,
					html: false
				},
				{
					label: "Vendedor",
					field: "vendedor",
					numeric: false,
					html: false
				},
				{
					label: "Proveedor",
					field: "proveedor",
					numeric: false,
					html: false
				},
				{
					label: "Total",
					field: "total",
					numeric: true,
					html: false
				}
			]
		}
	},
	mounted() {
		this.getPosts()
	},
	methods: {

		getPosts() {
			axios.get(this.url + "/ingreso").then(
				result => {
					this.posts = result.data[0]
				}, error => {
					console.error(error)
					this.$toast.error('Hubo un error al obtener los valores del sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
				}
			)
		},
		deletePost(id) {
			axios.delete(`${this.url}${id}`).then(() => {
				this.$toast.info( "Movimiento Ingreso #"+id+" Eliminado", 'Info', {
					position: "topCenter"
				});
				this.getPosts()
			}).catch((error) => {
				console.error(error)
				this.$toast.error('Hubo un error al eliminar el valor del sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
				});
			})

		}
	}
};
</script>