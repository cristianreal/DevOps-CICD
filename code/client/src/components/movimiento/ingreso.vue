<template>
<div class="container">
   <div class="row">
     <div class="col-lg-3">
      <div class="card text-white bg-danger mb-3" style="max-width: 20rem;">
         <div class="card-header">Movimiento ingreso</div>
         <div class="card-body">
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
               <select class="custom-select" v-model="provider" id="provider" name="provider">
                  <option selected>Seleccione un prpveedor</option>
                  <option v-for="(provider, index) in providers"
                     v-bind:item="provider" 
                     v-bind:index="index" 
                     v-bind:key="provider.pk_proveedor"
                     v-bind:value="provider.pk_proveedor">{{provider.nombre}} {{provider.apellido}}</option>
               </select>
            </div>
            <div class="form-group">
               <button type="button" class="btn btn-primary block" v-on:click="enviarInformacion">Guardar Lote</button>
            </div>
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
            <tr>
               <td><input type="number" class="form-control" v-model="quantity" id="quantity" ></td>
               <td>
                  <select class="custom-select" v-model="productId" id="productId" name="productId">
                     <option selected>Seleccione un producto</option>
                     <option v-for="(product) in products"
                        v-bind:item="product" 
                        v-bind:index="index" 
                        v-bind:key="product.pk_producto"
                        v-bind:value="product.pk_producto">{{product}}</option>
                  </select>
               </td>
               <td><input type="number"  step="0.01" class="form-control"  id="precio" ></td>
               <td><input type="number"  step="0.01" class="form-control" id="subtotal" disabled></td>
               <td><input type="button" class='btn btn-primary' v-on:click="add_row;"  value="Agregar Registro"></td>
            </tr>
         </table>
      </div>
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
            //validarCodigo();
            //calcularSubtotal();
            var val_quantity = document.getElementById("quantity").value;
            var val_productId = document.getElementById("productId").value;
            var table = document.getElementById("data_table");
            var table_len = (table.rows.length);
            table.insertRow(table_len).outerHTML = "<tr id='row" + table_len + "'><td id='quantity" + table_len + "'>" + val_quantity + "</td><td id='productId" + table_len + "'>" + val_productId + "</td><td> <input type='button' value='Delete' id='delete_button" + table_len + "' class='btn btn-danger' onclick='delete_row(" + table_len + ")'></td></tr>";
            this.quantity = "";
            this.productId = "";

            document.getElementById("delete_button" + table_len).style.visibility = "visible";

        }
    }
};
</script>