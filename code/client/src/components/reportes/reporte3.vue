

<template>
   <div class="container">
      <div class="row">
         <div class="col-sm">
            <label class="col-form-label" for="mes">Cantidad de Meses sin ventas</label>
         </div>
         <div class="col-sm">
            <input type="number" class="form-control" v-model="mes" id="mes" name="mes">
         </div>
         <div class="col-sm">
            <button  class="btn btn-primary"  v-on:click="busqueda">Ver reporte</button>
         </div>
      </div>
      <hr class="my-4">
      <datatable
         title="Listado de productos sin ventas en los ultimos meses "
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
         :data="chartData"
         :options="chartOptions"
         />
   </div>
</template>
<script>
import axios from 'axios';

export default {
   name: 'listar',
   data() {
      return {
         mes: this.$route.params.mes,
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
         let urlReporte =  this.$http + ":" + this.$port + "/api/reportes/reporte4/" + this.mes
         axios.get(urlReporte).then(
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
      onChartReady(chart, google) {
         let urlReporte =  this.$http + ":" + this.$port + "/api/productos/total"
         const options = {
                height: 500,
				title: 'Existencias de productos',
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
               let cantidadProductosSinExistencia = this.tableRows1.length;
               let cantidadProductosConExistencia = valores.total - cantidadProductosSinExistencia;
               chartData.push(["Productos con ventas en los ultimos "    + this.mes + " meses", cantidadProductosConExistencia]);
               chartData.push(["Productos sin ninguna venta en los ultimos "          + this.mes + " meses", cantidadProductosSinExistencia]);
               var data = google.visualization.arrayToDataTable(chartData);
					chart.draw(data, options)
            }, error => {
               console.error(error)
            }
         )
      },
      busqueda() {
         let ruta = '/reportes/reporte3/' + this.mes;
         this.$router.push(ruta);
         window.location.reload();

      }
   }
};
</script>