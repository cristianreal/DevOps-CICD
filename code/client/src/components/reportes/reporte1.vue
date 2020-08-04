<template>
   <div class="container">
      <datatable
         title="Listado de productos sin existencia"
         :columns="tableColumns1"
         :rows="tableRows1"
         >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/producto/detalle/' + props.row.pk_producto" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
            </td>
         </template>
      </datatable>
   </div>
</template>

<script>
import axios from 'axios';
import DataTable from "vue-materialize-datatable";
const _PATH = "/api/reportes/reporte1";

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
					field: "marca",
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
				}, error => {
					console.error(error)
				}
			)
		}
	}
};
</script>