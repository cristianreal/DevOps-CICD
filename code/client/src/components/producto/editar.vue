<template>
	<div class="container">
		<div class="jumbotron">
			<h4 align="center" >Editar Producto</h4>
                    <div class="form-group">
                        <label class="col-form-label" for="nameproduct">Nombre Producto</label>
                        <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="producto.nombre" id="nameproduct" name="nameproduct">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="descriptionproduct">Descripcion Producto</label>
                        <input type="text" class="form-control" placeholder="Ingrese el apellido" v-model="producto.descripcion" id="descriptionproduct" name="descriptionproduct">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="priceproduct">Precio Producto</label>
                        <input  type="number" placeholder="0.00" step="0.01" class="form-control" v-model="producto.precio" id="priceproduct" name="priceproduct">
                    </div>                  

                    <div class="form-group">
                        <label class="col-form-label" for="brandproduct">Marca Producto</label>
                        <select class="custom-select" v-model="producto.fk_marca" id="brandproduct" name="brandproduct">
                            <option selected>Seleccione la marca</option>
                                <option v-for="(marca, index) in marcas"
                                v-bind:item="marca" 
                                v-bind:index="index" 
                                v-bind:key="marca.pk_marca"
                                v-bind:value="marca.pk_marca">{{marca.nombre}}</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                    <button  class="btn btn-primary"  v-on:click="createPost">Guardar</button>
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
            marcas: [],
            producto:{
                nombre: '',
                descripcion: '',
                precio: '',
                fk_marca: ''
            },
            id_producto: this.$route.params.pkproducto,
            urlMarcas:  this.$http + ":" + this.$port +"/api/marcas/",
            url:  this.$http + ":" + this.$port + _PATH
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
                    let productos = result.data.productos[0]
                    if(productos.length == 0){
                        throw "No existe el producto indicado";    // throw a text
                    }else{
                        this.producto = productos[0];
                    }
                }, error => {
                    console.error(error)
                }
            )
        },
        createPost() {
            axios.put(this.url+"/"+this.id_producto, {
               nombre: this.producto.nombre,
               descripcion: this.producto.descripcion,
               precio: this.producto.precio,
               marca: this.producto.fk_marca
            }).then(() => {
                this.$toast.success(  "Producto ["+this.producto.nombre+"] Editado", 'Success', {
					position: "topCenter"
				});          
            }).catch((error) => {
                console.error(error)
                this.$toast.error('Hubo un error al guardar los valores en el sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
            })
        }
    }
};
</script>