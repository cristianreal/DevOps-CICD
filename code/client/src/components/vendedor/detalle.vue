<template>
	<div class="container">
		<div class="jumbotron">
			<h4 align="center" >Detalle vendedor #{{id_vendedor}}</h4>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="nameseller">Nombre vendedor</label>
                        <input disabled type="text" class="form-control" placeholder="Ingrese el nombre" v-model="vendedor.nombre" id="nameseller" name="nameseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="lastnameseller">Apellido vendedor</label>
                        <input disabled type="text" class="form-control" placeholder="Ingrese el apellido" v-model="vendedor.apellido" id="lastnameseller" name="lastnameseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="dirseller">Direccion domiciliar</label>
                        <input disabled type="text" class="form-control" placeholder="Ingrese la direccion de su domicilio" v-model="vendedor.direccion" id="dirseller" name="dirseller">
                    </div>
                    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="telseller">Telefono</label>
                        <input disabled type="text" class="form-control" placeholder="Ingrese el numero de telefono" v-model="vendedor.telefono" id="telseller" name="telseller">
                    </div>

                   <div class="form-group">
                        <label class="col-form-label" for="emailseller">Email</label>
                        <input disabled type="text" class="form-control" placeholder="Ingrese la direccion de correo electronico" v-model="vendedor.email" id="emailseller" name="emailseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="journalseller">Jornada</label>
                        <select disabled class="custom-select" v-model="vendedor.jornada" id="journalseller" name="journalseller">
                            <option selected="">Seleccione la jornada</option>
                            <option value="1">Matutina</option>
                            <option value="2">Vespertina</option>
                        </select>
                    </div>
                </div>
            </div>
		</div>
    </div>
</template>
<script>
import axios from 'axios';
const _PATH = "/api/vendedores";

export default {
    name: 'vendedor-detalle',
    data() {
        return {
            vendedor: {
                nombre : '',
                apellido: '',
                direccion: '',
                telefono: '',
                email: '',
                jornada: ''
            },
            id_vendedor: this.$route.params.pkvendedor,
            url:  this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.obtenerVendedor()
    },
    methods: {
        obtenerVendedor() {
            axios.get(this.url+"/"+this.id_vendedor).then(
                result => {
                    let vendedores = result.data[0]
                    if(vendedores.length == 0){
                        this.$toast.error('No existe el vendedor indicado!', 'Error', {
							position: "topCenter"
						});
                        throw "No existe el vendedor indicado";    // throw a text
                    }else{
                        this.vendedor = vendedores[0];
                    }
                }, error => {
                    console.error(error)
                    this.$toast.error('Hubo un error al obtener los valores del sistema, comuniquese con el administrador!', 'Error', {
						position: "topCenter"
					});
                }
            )
        }
    }
};
</script>