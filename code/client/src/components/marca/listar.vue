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
const _PATH = "/api/marcas/";

export default {
	name: 'marca-listar',
	data() {
		return {
			posts: [],
			url:  this.$http + ":" + this.$port + _PATH,
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
	methods: {
		getPosts() {
			axios.get(this.url).then(
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
				this.$toast.info( "Marca #"+id+" Eliminada", 'Info', {
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