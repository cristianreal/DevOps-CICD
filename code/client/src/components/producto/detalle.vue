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
        <datatable
         title="Listado de Movimientos"
         :columns="tableColumns1"
         :rows="tableRows1"
         >
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
            type="ColumnChart"
            :data="chartData"
            :options="chartOptions"
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
            error: '',
            text: '',
            elemento: '',
            marcas: [],
            productos:[],
            producto:{
                name: '',
                descripcion: '',
                precio: '',
                marca: ''
            },
            testButClicked: false,
            id_producto: this.$route.params.pkproducto,
            urlMarcas: "http://" + this.$http + ":" + this.$port +"/api/marcas/",
            url: "http://" + this.$http + ":" + this.$port + _PATH,
            tableColumns1: [{
			label: "Id",
			field: "pk_movimiento",
			numeric: false,
			html: false
			},
			{
				label: "Fecha",
				field: "fecha_movimiento",
				numeric: false,
				html: false
			},
			{
				label: "Ingreso",
				field: "cantidadIngreso",
				numeric: true,
				html: false
			},
            {
				label: "Egreso",
				field: "catidadEgreso",
				numeric: true,
				html: false
			}
			],
			tableRows1: [],
            chartData: [
                ['Year', 'Sales', 'Expenses', 'Profit'],
                ['2014', 1000, 400, 200],
                ['2015', 1170, 460, 250],
                ['2016', 660, 1120, 300],
                ['2017', 1030, 540, 350]
            ],
            chartOptions: {
                chart: {
                title: 'Company Performance',
                subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                }
            },
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
            axios.get(this.urlMarcas).then(
                result => {
                    this.marcas = result.data[0]
                }, error => {
                    console.error(error)
                }
            )
        },
        getProducto() {
            axios.get(this.url+"/"+this.id_producto).then(
                result => {
                    this.productos = result.data.productos[0]
                    this.tableRows1 = result.data.detalle[0]
                    if(this.productos.length == 0){
                        throw "No existe el producto indicado";    // throw a text
                    }else{
                        this.producto = this.productos[0];
                        this.nameproduct = this.productos[0].nombre;
                        this.descriptionproduct = this.productos[0].descripcion;
                        this.priceproduct = this.productos[0].precio;
                        this.brandproduct = this.productos[0].fk_marca;
                        this.quantity = this.productos[0].existencia;
                    }
                }, error => {
                    console.error(error)
                }
            )
        }
    }
};
</script>