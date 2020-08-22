

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
      <GChart
         type="PieChart"
         @ready="onChartReady"
         />
   </div>
</template>

<script>
import axios from 'axios';
const _PATH = "/api/reportes/reporte1";

export default {
	name: 'listar',
	data() {
		return {
			url:  this.$http + ":" + this.$port + _PATH,
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
	methods: {

		getPosts() {
			axios.get(this.url).then(
				result => {
					this.tableRows1 = result.data[0]
				}, error => {
					console.error(error)
					this.$toast.error('Hubo un error al obtener los valores del sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
				}
			)
		},
		onChartReady(chart,google) {
			let urlReporte =  this.$http + ":" + this.$port + "/api/productos/total"
			const options = {
                height: 500,
				title: 'Productos con existencia disponible en el inventario',
				subtitle: 'Estado de inventario',
				is3D: true,
				chartArea: {
					width: '75%'
				},
				legend: {
					position: 'bottom'
				}
			};
            let chartData= [
				['Tipo', 'Cantidad']
			];
			axios.get(urlReporte).then(
				result => {
					let valores = result.data[0][0];
					let cantidadProductosSinExistencia =  this.tableRows1.length;
					let cantidadProductosConExistencia = valores.total - cantidadProductosSinExistencia;
					chartData.push(["Con existencia", cantidadProductosConExistencia]);
					chartData.push(["Sin existencia", cantidadProductosSinExistencia]);
					var data = google.visualization.arrayToDataTable(chartData);
					chart.draw(data, options)
				}, error => {
					console.error(error)
				}
			)
		}
	}
};
</script>