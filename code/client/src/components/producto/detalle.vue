<template>
	<div class="container">
		<div class="jumbotron">
			<h4 align="center" >Editar Producto</h4>
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
		</div>
    </div>
</template>
<script>
import axios from 'axios';
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
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.getMarcas()
        this.getProducto()
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
                    this.productos = result.data[0]
                    if(this.productos.length == 0){
                        throw "No existe el producto indicado";    // throw a text
                    }else{
                        this.producto = this.productos[0];
                        this.nameproduct = this.productos[0].nombre;
                        this.descriptionproduct = this.productos[0].descripcion;
                        this.priceproduct = this.productos[0].precio;
                        this.brandproduct = this.productos[0].fk_marca;
                    }
                }, error => {
                    console.error(error)
                }
            )
        }
    }
};
</script>