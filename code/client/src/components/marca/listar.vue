<template>
   <div class="container">
      <datatable
         title="Listado de Marcas"
         :columns="tableColumns1"
         :rows="posts"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/marca/detalle/' + props.row.pk_marca" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
               <router-link :to="'/marca/editar/' + props.row.pk_marca" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">edit</i></router-link>
               <button class="btn red darken-2 waves-effect waves-light compact-btn"
                  @click="(e) => deletePost(props.row.pk_marca, e)">
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
const _PATH = "/api/marcas/";

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
					field: "pk_marca",
					numeric: true,
					html: false
				},
				{
					label: "Nombre",
					field: "nombre",
					numeric: false,
					html: false
				},
				{
					label: "WebPage",
					field: "pagina_web",
					numeric: false,
					html: false
				},
				{
					label: "Pais",
					field: "pais",
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