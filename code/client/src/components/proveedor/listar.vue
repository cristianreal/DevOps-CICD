<template>
   <div class="container">
      <datatable
         title="Listado de Proveedores"
         :columns="tableColumns1"
         :rows="posts"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/proveedor/detalle/' + props.row.pk_proveedor" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
               <router-link :to="'/proveedor/editar/' + props.row.pk_proveedor" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">edit</i></router-link>
               <button class="btn red darken-2 waves-effect waves-light compact-btn"
                  @click="(e) => deletePost(props.row.pk_proveedor, e)">
               <i class="material-icons white-text">delete</i>
               </button>
            </td>
         </template>
      </datatable>
   </div>
</template>

<script>
import axios from 'axios';
import DataTable from "vue-materialize-datatable";
const _PATH = "/api/proveedores/";

export default {
	name: 'listar',
	data() {
		return {
			posts: [],
			error: '',
			text: '',
			url: "http://" + this.$http + ":" + this.$port + _PATH,
			tableColumns1: [{
					label: "Id",
					field: "pk_proveedor",
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
					field: "direccionCompleta",
					numeric: false,
					html: false
				}
			]
		}
	},
	components: {
		"datatable": DataTable
	},
	mounted() {
		this.getPosts()
	},
	methods: {
		getPosts() {
			axios.get(this.url).then(
				result => {
					this.posts = result.data[0];
					this.posts = this.posts.map(function (obj) {
						obj.nombreCompleto = obj.nombre + " " + obj.apellido;
						obj.direccionCompleta = obj.direccion + " " + obj.ciudad + " " + obj.pais;
						return obj;
					});
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