<template>
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="card text-white bg-danger mb-3" style="max-width: 20rem;">
                <div class="card-header">Movimiento ingreso</div>
                    <div class="card-body">

                        <form method="post" id="form">
                            <div class="form-group">
                                    <label class="col-form-label" for="fecha">Fecha</label>
                                    <input type="date" class="form-control" placeholder="Default input" id="fecha" name="fecha">
                            </div>
                            <div class="form-group">
                                        <label for="descripcion">Descripcion</label>
                                    <textarea  class="form-control"  id="descripcion" name="descripcion" rows="11"></textarea>
                            </div>
                            
                        </form>
                    
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
                        <td>
                            <input type="text" class="form-control" onchange="validarCodigo()" placeholder="Seleccione un proveedor..." id="codigo" name="codigo" list="proveedorList"/><!--your input textbox-->
                            <datalist id="proveedorList">
                            <!--  @foreach($catalogoProductos as $x)
                                <option value='{{$x->codigo}}'> {{$x->codigo}}</option>
                            @endforeach -->
                            </datalist>
                                                        
                            </td>
                        <td><input type="number"  class="form-control" id="cantidad" onchange="calcularSubtotal()"></td>
                        <td><input type="number"  step="0.01" class="form-control"  id="precio" onchange="calcularSubtotal()"></td>
                        <td><input type="number"  step="0.01" class="form-control" id="subtotal" disabled></td>
                        <td><input type="button" class='btn btn-primary' onclick="add_row();"  value="Agregar Registro"></td>
                        </tr>
                    </table>
                </div>
                <button type="button" class="btn btn-primary block" onclick="enviarInformacion()">Guardar Lote</button>
            </div>
        </div>
    </div>
</template>
<script>
//import axios from 'axios';
const _PATH = "/api/movimientos/";

export default {
    name: 'crear',
    data() {
        return {
            error: '',
            text: '',
            elemento: '',
            testButClicked: false,
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    }
};
</script>
<style scoped>
.block {
  display: block;
  width: 100%;
  border: none;
  background-color: #4CAF50;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}
</style>
