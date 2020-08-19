

<template>
   <div class="container">
      <div class="row">
         <div class="col-sm">
            <label class="col-form-label" for="mes">Cantidad de Meses</label>
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
         :title="mensaje"
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

export default {
   data() {
      return {
         mes: this.$route.params.mes,
         mensaje: "Top 10 productos con mas ventas en los ultimos "+this.mes+" meses",
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
            },
            {
               label: "Unidades Vendidas",
               field: "Egreso",
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
         let urlReporte = "http://" + this.$http + ":" + this.$port + "/api/reportes/reporte5/" + this.mes
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
      busqueda() {
         let ruta = '/reportes/reporte4/' + this.mes;
         this.$router.push(ruta);
         window.location.reload();

      }
   }
};
</script>