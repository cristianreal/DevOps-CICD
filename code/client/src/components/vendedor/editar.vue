<template>
	<div class="container">
        <div v-if="testButClicked" class="alert alert-success" role="alert">
            {{elemento}} Guardado
        </div>
		<div class="jumbotron">
			<h4 align="center" >Editar vendedor #{{id_vendedor}}</h4>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="nameseller">Nombre vendedor</label>
                        <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="nameseller" id="nameseller" name="nameseller" :value="vendedor.nombre">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="lastnameseller">Apellido vendedor</label>
                        <input type="text" class="form-control" placeholder="Ingrese el apellido" v-model="lastnameseller" id="lastnameseller" name="lastnameseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="dirseller">Direccion domiciliar</label>
                        <input type="text" class="form-control" placeholder="Ingrese la direccion de su domicilio" v-model="dirseller" id="dirseller" name="dirseller">
                    </div>
                    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="telseller">Telefono</label>
                        <input type="text" class="form-control" placeholder="Ingrese el numero de telefono" v-model="telseller" id="telseller" name="telseller">
                    </div>

                   <div class="form-group">
                        <label class="col-form-label" for="emailseller">Email</label>
                        <input type="text" class="form-control" placeholder="Ingrese la direccion de correo electronico" v-model="emailseller" id="emailseller" name="emailseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="journalseller">Jornada</label>
                        <select class="custom-select" v-model="journalseller" id="journalseller" name="journalseller">
                            <option selected="">Seleccione la jornada</option>
                            <option value="1">Matutina</option>
                            <option value="2">Vespertina</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                    <button  class="btn btn-primary"  v-on:click="createPost">Editar</button>
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
    name: 'editar',
    data() {
        return {
            vendedores: [],
            vendedor: {
                nombre : '',
                apellido: '',
                direccion: '',
                telefono: '',
                email: '',
                jornada: ''
            },
            error: '',
            text: '',
            elemento: '',
            testButClicked: false,
            id_vendedor: this.$route.params.pkvendedor,
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    },
    mounted() {
        this.obtenerVendedor()
    },
    methods: {
        testToast() {
            this.testButClicked = true;
        },
        obtenerVendedor() {
            axios.get(this.url+"/"+this.id_vendedor).then(
                result => {
                    this.vendedores = result.data[0]
                    if(this.vendedores.length == 0){
                        throw "No existe el vendedor indicado";    // throw a text
                    }else{
                        this.vendedor = this.vendedores[0];
                        this.nameseller = this.vendedores[0].nombre;
                        this.lastnameseller = this.vendedores[0].apellido;
                        this.dirseller = this.vendedores[0].direccion;
                        this.telseller = this.vendedores[0].telefono;
                        this.emailseller = this.vendedores[0].email;
                        this.journalseller = this.vendedores[0].jornada;
                    }
                }, error => {
                    console.error(error)
                }
            )
        },
        createPost() {
            axios.put(this.url+"/"+this.id_vendedor, {
                nombre: this.nameseller,
                apellido: this.lastnameseller,
                direccion: this.dirseller,
                telefono: this.telseller,
                email: this.emailseller,
                jornada: this.journalseller
            }).then(() => {
                this.elemento = "Vendedor #"+this.id_vendedor
                this.testToast()
            }).catch((error) => {
                console.error(error)
                return;
            })
        }
    },
    watch: {
        testButClicked(val) {
            if (val) {
                setTimeout(() => this.testButClicked = false, 1000);
            }
        }
    }
};
</script>