<template>
   <div class="container">
      <h3 align="center">Egreso de producto</h3>
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
                  <input type="text" readonly class="form-control" placeholder="Ingrese el nombre" v-model="input.nombre" id="seller" name="seller">
               </div>
               <div class="form-group">
                  <label for="total">Total</label>
                  <input type="number" step="0.01" class="form-control" v-model="total" id="total">
               </div>
               <button type="button" class="btn btn-primary"  v-on:click="createPost">Guardar Lote</button>
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
                     <td><input type="number" style="width: 5em" v-model="cantidad" class="form-control" id="cantidad" @change="onChange()"></td>
                     <td>
                        <select class="custom-select" style="width: 15em" v-model="producto" id="producto" name="producto" @change="onChange()">
                           <option v-for="(product, index) in products"
                              v-bind:item="product" 
                              v-bind:index="index" 
                              v-bind:key="product.pk_producto"
                              v-bind:value="product">{{product.nombre}}</option>
                        </select>
                     </td>
                     <td><input readonly type="number"  step="0.01"  style="width: 5em" v-model="precio" class="form-control" id="precio" ></td>
                     <td><input readonly type="number"  step="0.01" style="width: 7em" v-model="subtotal" class="form-control" id="subtotal"></td>
                     <td><input type="button" class='btn btn-primary' value="Agregar Registro" v-on:click="add_row"></td>
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
   </div>
</template>

<script>
import axios from 'axios';
const _PATH = "/api/movimientos/egreso";

export default {
    name: 'crear',
    data() {
        return {
            providers:[],
            products:[],
            rowData:[] ,
            total: '0.00',
            cantidad: '1',
            precio: '0.00',
            subtotal: '0.00',
            input:{
                nombre: 'Vendedor Prueba',
                pk_usuario: '1'
            },
            seller: 'venddor prueba',
            date: new Date().toISOString().slice(0,10),
            bare_url:  "http://" + this.$http + ":" + this.$port,
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.getProductos()
        this.getElementos()
        if (localStorage.getItem('user') != null){
            let usuario = JSON.parse(localStorage.getItem('user'));
            let nombre = usuario.nombre + " "+usuario.apellido;
            let pk_usuario = usuario.pk_usuario
            this.input = {
                nombre: nombre,
                pk_usuario:pk_usuario
            };
            this.seller = nombre
            this.$emit('refresh')
        }
    },
    methods: {
         getElementos() {
            axios.get(this.bare_url+"/api/proveedores").then(
                result => {
                    this.providers = result.data[0]
                }, error => {
                    console.error(error)
                    this.$toast.error('Hubo un error al obtener los valores del sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
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
        },
        add_row() {
            var my_object = {
                cantidad:this.cantidad,
                producto:this.producto.nombre,
                fk_producto:this.producto.pk_producto,
                precio:this.precio,
                subtotal: this.subtotal
            };
            this.rowData.push(my_object);
            this.total = parseFloat(Number(this.total) + Number(this.subtotal)).toFixed(2);
            this.cantidad = '1';
            this.precio = '';
            this.producto = '';
            this.subtotal = '';
        },
        delete_row(no)
        {
            this.total = parseFloat(this.total - this.rowData[no].subtotal).toFixed(2);
            this.rowData.splice(no,1);
        },
        onChange() {   
            console.log(this.producto)        
            this.precio = parseFloat(this.producto.precio).toFixed(2);
            this.subtotal = parseFloat(this.cantidad * this.precio).toFixed(2);
        },
        createPost() {
            axios.post(this.url, {
                fecha_movimiento:this.date,
                fk_vendedor:this.input.pk_usuario,
                detalle: this.rowData
            }).then(() => {
                this.$toast.success( "Moviento Almacenado", 'Success', {
					position: "topCenter"
				});            
                setTimeout(function(){
                    window.location.reload()
                    }, 1000);
            }).catch((error) => {
                console.error(error)
                this.$toast.error('Hubo un error al guardar los valores en el sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
                return;
            })
        }


    }
};
</script>