<template>
   <div class="container">
      <datatable
         title="Listado de Productos"
         :columns="tableColumns1"
         :rows="tableRows1"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/producto/detalle/' + props.row.pk_producto" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
               <router-link :to="'/producto/editar/' + props.row.pk_producto" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">edit</i></router-link>
               <button class="btn red darken-2 waves-effect waves-light compact-btn"
                  @click="(e) => deletePost(props.row.pk_producto, e)">
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
const _PATH = "/api/productos/";

export default {
	name: 'listar',
	data() {
		return {
			error: '',
			text: '',
			url: "http://" + this.$http + ":" + this.$port + _PATH,
			tableColumns1: [{
					label: "Id",
					field: "pk_producto",
					numeric: false,
					html: false
				},
				{
					label: "Nombre",
					field: "nombre",
					numeric: false,
					html: false
				},
				{
					label: "Descripcion",
					field: "descripcion",
					numeric: false,
					html: false
				},
				{
					label: "Precio",
					field: "precio",
					numeric: true,
					html: false
				},
				{
					label: "Marca",
					field: "Marca",
					numeric: false,
					html: false
				},
				{
					label: "Existencia",
					field: "existencia",
					numeric: false,
					html: false
				}
			],
			tableRows1: []
		}
	},
	mounted() {
		this.getPosts()
	},
	components: {
		"datatable": DataTable
	},
	methods: {

		getPosts() {
			axios.get(this.url).then(
				result => {
					this.tableRows1 = result.data[0]
					this.tableRows1 = this.tableRows1.map(function (obj) {
						obj.existencia = obj.existencia==null?0:obj.existencia;
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