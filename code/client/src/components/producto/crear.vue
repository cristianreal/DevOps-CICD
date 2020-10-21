<template>
	<div class="container">
		<div class="jumbotron">
			<h4 align="center" >Crear Producto</h4>
                    <div class="form-group">
                        <label class="col-form-label" for="nameproduct">Nombre Producto</label>
                        <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="nameproduct" id="nameproduct" name="nameproduct">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="descriptionproduct">Descripcion Producto</label>
                        <input type="text" class="form-control" placeholder="Ingrese el apellido" v-model="descriptionproduct" id="descriptionproduct" name="descriptionproduct">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="priceproduct">Precio Producto</label>
                        <input  type="number" placeholder="0.00" step="0.01" class="form-control" v-model="priceproduct" id="priceproduct" name="priceproduct">
                    </div>                  

                    <div class="form-group">
                        <label class="col-form-label" for="brandproduct">Marca Producto</label>
                        <select class="custom-select" v-model="brandproduct" id="brandproduct" name="brandproduct">
                            <option>Seleccione la marca</option>
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
const _PATH = "/api/productos/";

export default {
    name: 'producto-crear',
    data() {
        return {
            brandproduct: 'Seleccione la marca',
            marcas: [],
            urlMarcas:  this.$http + ":" + this.$port +"/api/marcas/",
            url:  this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.getPosts()
    },
    methods: {
         getPosts() {
            axios.get(this.urlMarcas).then(
                result => {
                    this.marcas = result.data[0]
                }, error => {
                    console.error(error)
                    this.$toast.error('Hubo un error al obtener los valores del sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
                }
            )
        },
        createPost() {
            axios.post(this.url, {
               nombre: this.nameproduct,
               descripcion: this.descriptionproduct,
               precio: this.priceproduct,
               marca: this.brandproduct
            }).then(() => {
                this.$toast.success( "Producto ["+this.nameproduct+"] Guardado", 'Success', {
					position: "topCenter"
				});
                this.nameproduct=  ''
                this.descriptionproduct= ''
                this.priceproduct= ''
                this.brandproduct= ''              
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
<style scoped>
    @media screen and (max-width: 600px) {
    .column {
        width: 100%;
    }
    }
</style>