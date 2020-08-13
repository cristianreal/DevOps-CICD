<template>
   <div class="container">
      <div class="jumbotron">
         <h4 align="center" >Detalle Producto</h4>
         <div class="form-group">
            <label class="col-form-label" for="nameproduct">Nombre Producto</label>
            <input disabled type="text" class="form-control" placeholder="Ingrese el nombre" v-model="nameproduct" :value="producto.nombre" id="nameproduct" name="nameproduct">
         </div>
         <div class="form-group">
            <label class="col-form-label" for="descriptionproduct">Descripcion Producto</label>
            <input disabled type="text" class="form-control" placeholder="Ingrese el apellido" v-model="descriptionproduct" id="descriptionproduct" name="descriptionproduct">
         </div>
         <div class="form-group">
            <label class="col-form-label" for="priceproduct">Precio Producto</label>
            <input disabled  type="number" placeholder="0.00" step="0.01" class="form-control" v-model="priceproduct" id="priceproduct" name="priceproduct">
         </div>
         <div class="form-group">
            <label class="col-form-label" for="brandproduct">Marca Producto</label>
            <select disabled class="custom-select" v-model="brandproduct" id="brandproduct" name="brandproduct">
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
            <input disabled  type="number" placeholder="0" step="1" class="form-control" v-model="quantity" id="quantity" name="quantity">
         </div>
      </div>
         <datatable title="Listado de Movimientos" :columns="tableColumns1" :rows="tableRows1" >
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
import DataTable from "vue-materialize-datatable";
const _PATH = "/api/productos";
export default {
	name: 'crear',
	data() {
		return {
			marcas: [],
			productos: [],
			producto: {
				name: '',
				descripcion: '',
				precio: '',
				marca: ''
			},
			id_producto: this.$route.params.pkproducto,
			url: "http://" + this.$http + ":" + this.$port + _PATH,
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
			tableRows1: [],
			chartOptionsLinear: {
				chart: {
					hAxis: {
						title: 'Movimientos',
						minValue: ''
					},
					vAxis: {
						title: 'Existencia',
						minValue: 0
					},
					title: 'Company Performance',
					subtitle: 'Sales, Expenses, and Profit: 2014-2017',
					chartArea: {
						width: '50%'
					},
					legend: {
						position: 'bottom'
					}
				}
			}
		}
	},
	mounted() {
		this.getMarcas()
		this.getProducto()
	},
	components: {
		"datatable": DataTable
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
			axios.get(this.url + "/" + this.id_producto).then(result => {
				this.productos = result.data.productos[0]
				if (this.productos.length == 0) {
					throw "No existe el producto indicado"; // throw a text
				} else {
					this.producto = this.productos[0];
					this.nameproduct = this.productos[0].nombre;
					this.descriptionproduct = this.productos[0].descripcion;
					this.priceproduct = this.productos[0].precio;
					this.brandproduct = this.productos[0].fk_marca;
					this.quantity = this.productos[0].existencia;
				}
			}, error => {
				console.error(error)
			})
		},
        onChartReadyLine(chart, google) {
			let urlReporte = "http://" + this.$http + ":" + this.$port + "/api/reportes/reporte9/"+this.id_producto
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
            let chartData= [
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
            let chartData= [
				['Fecha', 'Ingresos', 'Egresos']
			];
			function request(obj, no, callback) {
				axios.get(urlReporte + "/" + obj.id_producto + "/" + no).then(result => {
					let valores = result.data[0][0];
					chartData.push([valores.fecha, valores.ingreso, valores.egreso]);
					if (no > 0) {
						callback(obj, no - 1, callback)
					} else {
						var data = google.visualization.arrayToDataTable(chartData);
						chart.draw(data, options)
					}
				}, error => {
					console.error(error)
				})
			}
			request(this, 3, request)
		}
	}
};
</script>