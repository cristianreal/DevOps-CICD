<template>
<div class="container">
   <h3 align="center">Detalle de ingreso - Movimiento #{{ id_movimiento }}</h3>
    <hr class="my-4">
   <div class="row">
      <div class="col-lg-3" >
         <div style="max-width: 20rem;">
            <div class="form-group">
               <label class="col-form-label" for="date">Fecha</label>
               <input type="text" class="form-control" v-model="date" placeholder="Default input" id="date" name="date" :value="ingreso.date">
            </div>
            <div class="form-group">
               <label for="seller">Vendedor</label>
               <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="seller" id="seller" name="seller" :value="ingreso.seller">
            </div>
            <div class="form-group">
               <label for="proveedor">Proveedor</label>
               <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="proveedor" id="proveedor" name="proveedor" :value="ingreso.proveedor">
            </div>
            <div class="form-group">
               <label for="total">Total</label>
               <input type="text" class="form-control" v-model="total" id="total" :value="ingreso.total">
            </div>
         </div>
      </div>
      <div class="col-lg-9">
         <div style="overflow-y: scroll; height:460px;">
            <table align='center' id="data_table" name="data_table" class="table table-hover">
               <tr>
                  <th>Cantidad</th>
                  <th>Producto</th>
                  <th>Precio</th>
                  <th>Subtotal</th>
                  <th>Acciones</th>
               </tr>
               <tr v-for="(item,index) in rowData" v-bind:key="index" >
                    <th scope="row">{{ item.cantidad }}</th>
                    <td>{{ item.producto }}</td>
                    <td>{{ item.precio }}</td>
                    <td>{{ item.subtotal }}</td>
               <td><input type="button" class='btn btn-danger' value="Quitar" v-on:click="delete_row(index)"></td>
                </tr>
            </table>
         </div>
      </div>
</div>
</template>
<script>
import axios from 'axios';

export default {
    name: 'crear',
    data() {
        return {
            error: '',
            text: '',
            id_movimiento: this.$route.params.pkmovimiento,
            ingreso:{
                date: '',
                seller: '',
                proveedor: '',
                total: ''
            },
            products:[],
            bare_url:  "http://" + this.$http + ":" + this.$port,
        }
    },
    mounted() {
        this.getMovimiento()
       // this.getElementos()
    },
    methods: {
         getMovimiento() {
            axios.get(this.bare_url+"/api/movimientos/ingreso/"+this.id_movimiento).then(
                result => {
                    let movimiento = result.data[0]
                    console.log(movimiento)
                    this.ingreso.date = movimiento.fecha_movimiento
                    this.ingreso.seller = movimiento.vendedor
                    this.ingreso.proveedor = movimiento.proveedor
                    this.ingreso.total = movimiento.total
                }, error => {
                    console.error(error)
                }
            )
         },
         getProductos(){
            axios.get(this.bare_url+"/api/productos").then(
                result => {
                    this.products = result.data[0]
                }, error => {
                    console.error(error)
                }
            )
        }
    }
};
</script>