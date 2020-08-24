<template>
   <div class="container">
      <datatable
         title="Listado de Vendedores"
         :columns="tableColumns1"
         :rows="posts"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/vendedor/detalle/' + props.row.pk_vendedor" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
               <router-link :to="'/vendedor/editar/' + props.row.pk_vendedor" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">edit</i></router-link>
               <button class="btn red darken-2 waves-effect waves-light compact-btn"
                  @click="(e) => deletePost(props.row.pk_vendedor, e)">
               <i class="material-icons white-text">delete</i>
               </button>
            </td>
         </template>
      </datatable>
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
			url:  this.$http + ":" + this.$port + _PATH,
			tableColumns1: [{
					label: "Id",
					field: "pk_vendedor",
					numeric: true,
					html: false
				},
				{
					label: "Nombre",
					field: "nombreCompleto",
					numeric: false,
					html: false
				},
				{
					label: "Telefono",
					field: "telefono",
					numeric: false,
					html: false
				},
				{
					label: "Email",
					field: "email",
					numeric: false,
					html: false
				},
				{
					label: "Direccion",
					field: "direccion",
					numeric: false,
					html: false
				},
				{
					label: "Jornada",
					field: "jornadaValor",
					numeric: false,
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
			axios.get(this.url).then(
				result => {
					this.posts = result.data[0]
					this.posts = this.posts.map(function (obj) {
						obj.nombreCompleto = obj.nombre + " " + obj.apellido;
						obj.jornadaValor = (obj.jornada == 1) ? "Matutina" : "Vespertina";
						return obj;
					});
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
				this.$toast.info( "Vendedor #"+id+" Eliminado", 'Info', {
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