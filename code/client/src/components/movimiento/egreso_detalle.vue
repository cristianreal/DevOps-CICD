<template>
<div class="container">
   <h3 align="center">Detalle de ingreso - Movimiento #{{ id_movimiento }}</h3>
    <hr class="my-4">
   <div class="row">
      <div class="col-lg-3" >
         <div style="max-width: 20rem;">
            <div class="form-group">
               <label class="col-form-label" for="date">Fecha</label>
               <input disabled type="text" class="form-control" v-model="date" placeholder="Default input" id="date" name="date" :value="date">
            </div>
            <div class="form-group">
               <label for="seller">Vendedor</label>
               <input  disabled type="text" class="form-control" placeholder="Ingrese el nombre" v-model="seller" id="seller" name="seller" :value="seller">
            </div>
            <div class="form-group">
               <label for="total">Total</label>
               <input  disabled type="text" class="form-control" v-model="total" id="total" :value="total">
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
               </tr>
               <tr v-for="(item,index) in rowData" v-bind:key="index" >
                    <th scope="row">{{ item.cantidad }}</th>
                    <td>{{ item.producto }}</td>
                    <td>{{ item.precio }}</td>
                    <td>{{ item.total }}</td>
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
            date: 'hola',
            seller: '',
            proveedor: '',
            total: '',
            rowData:[],
            bare_url:  "http://" + this.$http + ":" + this.$port,
        }
    },
    mounted() {
        this.getMovimiento()
        this.getDetalle()
    },
    methods: {
         getMovimiento() {
            axios.get(this.bare_url+"/api/movimientos/egreso/"+this.id_movimiento).then(
                result => {
                    let movimiento = result.data[0]
                    if(movimiento.length == 0){
                        throw "No existe el producto indicado";    // throw a text
                    }else{
                        this.date = movimiento[0].fecha_movimiento
                        this.seller = movimiento[0].vendedor
                        this.total = movimiento[0].total
                    }
                }, error => {
                    console.error(error)
                }
            )
         },
         getDetalle(){
            axios.get(this.bare_url+"/api/movimientos/detalle/"+this.id_movimiento).then(
                result => {
                    this.rowData = result.data[0]
                    this.rowData.forEach( function(element){
                        element.precio = parseFloat(element.precio).toFixed(2)
                        element.total = parseFloat(element.total).toFixed(2)
                    });
                }, error => {
                    console.error(error)
                }
            )
        }
    }
};
</script>