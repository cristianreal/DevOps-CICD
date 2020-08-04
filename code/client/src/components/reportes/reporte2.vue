

<template>
   <div class="container">
      <div class="row">
         <div class="col-sm">
            <label class="col-form-label" for="limite">Limite de existencias</label>
         </div>
         <div class="col-sm">
            <input type="number" class="form-control" v-model="limite" id="limite" name="limite">
         </div>
         <div class="col-sm">
            <button  class="btn btn-primary"  v-on:click="busqueda">Ver reporte</button>
         </div>
      </div>
      <hr class="my-4">
      <datatable
         title="Listado de productos con menos unidades del limite"
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
import DataTable from "vue-materialize-datatable";

export default {
   name: 'listar',
   data() {
      return {
         limite: this.$route.params.limite,
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
         tableRows1: [],
         chartData: [
            ['Tipo', 'Cantidad']
         ],
         chartOptions: {
            chart: {
               title: 'Existencias de productos',
               subtitle: 'Estado de inventario',
               is3D: true
            }
         }
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
         let urlReporte = "http://" + this.$http + ":" + this.$port + "/api/reportes/reporte2/" + this.limite
         axios.get(urlReporte).then(
            result => {
               this.tableRows1 = result.data[0]
            }, error => {
               console.error(error)
            }
         )
      },
      onChartReady() {
         let urlReporte = "http://" + this.$http + ":" + this.$port + "/api/productos/total"
         axios.get(urlReporte).then(
            result => {
               let valores = result.data[0][0];
               let cantidadProductosSinExistencia = this.tableRows1.length;
               let cantidadProductosConExistencia = valores.total - cantidadProductosSinExistencia;
               this.chartData.push(["Mas de " + this.limite + " unidades", cantidadProductosConExistencia]);
               this.chartData.push(["Menos de " + this.limite + " unidades", cantidadProductosSinExistencia]);
            }, error => {
               console.error(error)
            }
         )
      },
      busqueda() {
         let ruta = '/reportes/reporte2/' + this.limite;
         this.$router.push(ruta);
         window.location.reload();

      }
   }
};
</script>