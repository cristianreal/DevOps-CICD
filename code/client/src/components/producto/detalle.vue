<template>
   <div class="container">
      <div class="jumbotron">
         <h4 align="center" >Detalle Producto</h4>
         <div class="form-group">
            <label class="col-form-label" for="nameproduct">Nombre Producto</label>
            <input disabled type="text" class="form-control" placeholder="Ingrese el nombre" v-model="producto.nombre" id="nameproduct" name="nameproduct">
         </div>
         <div class="form-group">
            <label class="col-form-label" for="descriptionproduct">Descripcion Producto</label>
            <input disabled type="text" class="form-control" placeholder="Ingrese el apellido" v-model="producto.descripcion" id="descriptionproduct" name="descriptionproduct">
         </div>
         <div class="form-group">
            <label class="col-form-label" for="priceproduct">Precio Producto</label>
            <input disabled  type="number" placeholder="0.00" step="0.01" class="form-control" v-model="producto.precio" id="priceproduct" name="priceproduct">
         </div>
         <div class="form-group">
            <label class="col-form-label" for="brandproduct">Marca Producto</label>
            <select disabled class="custom-select" 											   v-model="producto.fk_marca" id="brandproduct" name="brandproduct">
               <option selected>Seleccione la marca</option>
               <option v-for="(marca, index) in marcas"
                  v-bind:item="marca" 
                  v-bind:index="index" 
                  v-bind:key="marca.pk_marca"
                  v-bind:value="marca.pk_marca">{{marca.nombre}}</option>
            </select>
         </div>
         <div class="form-group">
            <label class="col-form-label" for="quantity">Existencia</label>
            <input disabled  type="number" placeholder="0" step="1" class="form-control" 		v-model="producto.existencia" id="quantity" name="quantity">
         </div>
      </div>
      <datatable title="Listado de Movimientos" :columns="tableColumns1" :rows="tableRows1" :perPage="[5, 10, 15, 20]" >
         <th slot="thead-tr">
            Actions
         </th>
         <template slot="tbody-tr" scope="props">
            <td>
               <router-link :to="'/movimiento/'+props.row.tipo_movimiento+'/detalle/' + props.row.pk_movimiento" class="btn red darken-2 waves-effect waves-light compact-btn"  ><i class="material-icons white-text">visibility</i></router-link>
            </td>
         </template>
      </datatable>
      <GChart
         type="LineChart"
         @ready="onChartReadyLine"
         />
      <GChart
         type="BarChart"
         @ready="onChartReady"
         />
   </div>
</template>
<script>
import axios from 'axios';
const _PATH = "/api/productos";

export default {
	name: 'crear',
	data() {
		return {
			marcas: [],
			producto: {
				name: '',
				descripcion: '',
				precio: '',
				marca: ''
			},
			tableColumns1: [{
				label: "Id",
				field: "pk_movimiento",
				numeric: false,
				html: false
			}, {
				label: "Fecha",
				field: "fecha_movimiento",
				numeric: false,
				html: false
			}, {
				label: "Ingreso",
				field: "cantidadIngreso",
				numeric: true,
				html: false
			}, {
				label: "Egreso",
				field: "catidadEgreso",
				numeric: true,
				html: false
			}, {
				label: "Existencia",
				field: "existencia",
				numeric: true,
				html: false
			}],
			tableRows1: []
		}
	},
	mounted() {
		this.getMarcas();
		this.getProducto();
	},
	methods: {
		getMarcas() {
			let urlMarcas = "http://" + this.$http + ":" + this.$port + "/api/marcas/";
			axios.get(urlMarcas).then(result => {
				this.marcas = result.data[0]
			}, error => {
				console.error(error)
			})
		},
		getProducto() {
			let id_producto= this.$route.params.pkproducto;
			let url = "http://" + this.$http + ":" + this.$port + _PATH + "/" + id_producto;
			axios.get(url).then(result => {
				let productos = result.data.productos[0]
				if (productos.length == 0) {
					this.$toast.error('No existe el producto indicado!', 'Error', {
						position: "topCenter"
					});
					throw "No existe el producto indicado"; // throw a text
				} else {
					this.producto = productos[0];
				}
			}, error => {
				console.error(error)
				this.$toast.error('Existe un error al obtener los valores del sistema, comuniquese con el administrador!', 'Error', {
					position: "topCenter"
				});
			})
		},
		onChartReadyLine(chart, google) {
			let id_producto= this.$route.params.pkproducto;
			let urlReporte = "http://" + this.$http + ":" + this.$port + "/api/reportes/reporte9/" + id_producto
			const options = {
				height: 500,
				title: 'Historial Movimientos',
				subtitle: 'Ingresos y Egresos a lo largo del tiempo',
				chartArea: {
					width: '75%'
				},
				hAxis: {
					title: 'Movimientos',
					minValue: ''
				},
				vAxis: {
					title: 'Existencia',
					minValue: 0
				},
				legend: {
					position: 'bottom'
				}
			};
			let chartData = [
				['Fecha', 'Existencias'],
			];
			axios.get(urlReporte).then(result => {
				let valores = result.data[0];
				this.tableRows1 = valores;
				if (valores.length == 0) {
					chartData.push(["No data", 0]);
				}
				valores.forEach(elemento => {
					chartData.push([elemento.fecha_movimiento, elemento.existencia]);
				});
				var data = google.visualization.arrayToDataTable(chartData);
				chart.draw(data, options)
			}, error => {
				console.error(error)
			})
		},
		onChartReady(chart, google) {
			let id_producto= this.$route.params.pkproducto;
			let urlReporte = "http://" + this.$http + ":" + this.$port + "/api/reportes/reporte3"
			const options = {
				height: 500,
				title: 'Movimientos en los ultimos tres meses',
				subtitle: 'Ingresos y Egresos',
				chartArea: {
					width: '85%'
				},
				legend: {
					position: 'bottom'
				}
			};
			let chartData = [
				['Fecha', 'Ingresos', 'Egresos']
			];
			function request(no, callback) {
				axios.get(urlReporte + "/" + id_producto + "/" + no).then(result => {
					let valores = result.data[0][0];
					chartData.push([valores.fecha, valores.ingreso, valores.egreso]);
					if (no > 0) {
						callback(no - 1, callback)
					} else {
						var data = google.visualization.arrayToDataTable(chartData);
						chart.draw(data, options)
					}
				}, error => {
					console.error(error)
				})
			}
			request(3, request)
		}
	}
};
</script>