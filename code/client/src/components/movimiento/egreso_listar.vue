

<template>
   <div class="container">
      <datatable
         title="Listado de Egresos"
         :columns="tableColumns1"
         :rows="posts"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/movimiento/egreso/detalle/' + props.row.pk_movimiento" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
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
import DataTable from "vue-materialize-datatable";
const _PATH = "/api/movimientos/";

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
	components: {
		"datatable": DataTable
	},
	methods: {

		getPosts() {
			axios.get(this.url + "/egreso").then(
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