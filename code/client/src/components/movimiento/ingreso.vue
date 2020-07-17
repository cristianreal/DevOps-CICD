<template>
<div class="container">
   <h1 class="display-3">Ingreso de producto</h1>
    <hr class="my-4">
   <div class="row">
      <div class="col-lg-3" >
         <div style="max-width: 20rem;">
            <div class="form-group">
               <label class="col-form-label" for="date">Fecha</label>
               <input type="date" class="form-control" v-model="date" placeholder="Default input" id="date" name="date">
            </div>
            <div class="form-group">
               <label for="seller">Vendedor</label>
               <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="seller" id="seller" name="seller" :value="seller">
            </div>
            <div class="form-group">
               <label class="col-form-label" for="provider">Proveedor</label>
               <select class="custom-select" v-model="Proveedor" id="Proveedor" name="Proveedor">
                  <option>Seleccione un proveedor</option>
                  <option v-for="(provider, index) in providers"
                     v-bind:item="provider" 
                     v-bind:index="index" 
                     v-bind:key="provider.pk_proveedor"
                     v-bind:value="provider.pk_proveedor">{{provider.nombre}} {{provider.apellido}}</option>
               </select>
            </div>
            <button type="button" class="btn btn-primary">Guardar Lote</button>
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
               <tr>
                <td><input type="number" style="width: 5em"  class="form-control" id="cantidad"></td>
               <td>
                    <select class="custom-select" style="width: 15em" v-model="producto" id="producto" name="producto">
                    <option v-for="(product, index) in products"
                     v-bind:item="product" 
                     v-bind:index="index" 
                     v-bind:key="product.pk_producto"
                     v-bind:value="product.pk_producto">{{product.nombre}}</option>
                  </select>
               </td>
                <td><input type="number"  style="width: 5em" class="form-control" id="precio"></td>
                <td><input type="number"  style="width: 7em" class="form-control" id="subtotal"></td>
               <td><input type="button" class='btn btn-primary' value="Agregar Registro" v-on:click="add_row"></td>
               </tr>
               <tr v-for="(product, index) in rowData" v-bind:key="index"   >
                    <th scope="row">{{ item.cantidad }}</th>
                    <td>{{ item.producto }}</td>
                    <td>{{ item.precio }}</td>
                    <td>{{ item.subtotal }}</td>
                </tr>
            </table>
         </div>
      </div>
</div>
</template>
<script>
import axios from 'axios';
const _PATH = "/api/movimientos/";

export default {
    name: 'crear',
    data() {
        return {
            error: '',
            text: '',
            providers:[],
            products:[],
            elemento: '',
            rowData:[] ,
            vendorName: 'Vendedor Prueba',
            pk_vendor: '1',
            seller: 'venddor prueba',
            date: new Date().toISOString().slice(0,10),
            testButClicked: false,
            bare_url:  "http://" + this.$http + ":" + this.$port,
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.getProductos()
        this.getElementos()
    },
    methods: {
         getElementos() {
            axios.get(this.bare_url+"/api/proveedores").then(
                result => {
                    this.providers = result.data[0]
            console.log(this.providers)
                }, error => {
                    console.error(error)
                }
            )
         },
         getProductos(){
            axios.get(this.bare_url+"/api/productos").then(
                result => {
                    this.products = result.data[0]
                    console.log(this.products)
                }, error => {
                    console.error(error)
                }
            )
        },
        add_row() {
            var my_object = {
                cantidad:this.cantidad,
                producto:this.producto,
                precio:this.precio,
                subtotal: this.subtotal,
            };
            this.rowData.push(my_object);

         //   validarCodigo();
         //   calcularSubtotal();
         //   var codigo = document.getElementById("codigo").value;
         //   var cantidad = document.getElementById("cantidad").value;
         //   var precio = document.getElementById("precio").value;
         //   var subtotal = document.getElementById("subtotal").value;
         //   if (!codigo || !cantidad || !precio || !subtotal) {
         //       alert("Debe de insertar todos los campos");
         //       return;
         //   }
         //   var bandera = false;
            //var table = document.getElementById("data_table");
            // var table_len=(table.rows.length)-1;
           // var table_len = (table.rows.length);

         //   table.insertRow(table_len).outerHTML = "<tr id='row" + table_len + "'><td id='codigo" + table_len + "'>" + "10" + "</td><td id='cantidad" + table_len + "'>" + "Producto1" + "</td><td id='precio" + table_len + "'>" + "10.23" + "</td><td id='subtotal" + table_len + "'>" + "150.23" + "</td><td> <input type='button' value='Delete' id='delete_button" + table_len + "' class='btn btn-danger' v-on:click='delete_row(" + table_len + ")'></td></tr>";

        //    document.getElementById("codigo").value = "";
        //    document.getElementById("cantidad").value = "";
        //    document.getElementById("precio").value = "";
        //    document.getElementById("subtotal").value = "";
         //   document.getElementById("delete_button" + table_len).style.visibility = "visible";

        },
        delete_row(no)
        {
            document.getElementById("row"+no+"").outerHTML="";
        }


    }
};
</script>