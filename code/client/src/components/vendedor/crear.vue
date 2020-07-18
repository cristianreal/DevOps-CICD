<template>
	<div class="container">
        <div v-if="testButClicked" class="alert alert-success" role="alert">
            {{elemento}} Guardado
        </div>
		<div class="jumbotron">
			<h4 align="center" >Crear Vendedor</h4>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="nameseller">Nombre vendedor</label>
                        <input type="text" class="form-control" placeholder="Ingrese el nombre" v-model="nameseller" id="nameseller" name="nameseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="lastnameseller">Apellido vendedor</label>
                        <input type="text" class="form-control" placeholder="Ingrese el apellido" v-model="lastnameseller" id="lastnameseller" name="lastnameseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="dirseller">Direccion domiciliar</label>
                        <input type="text" class="form-control" placeholder="Ingrese la direccion de su domicilio" v-model="dirseller" id="dirseller" name="dirseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="telseller">Telefono</label>
                        <input type="text" class="form-control" placeholder="Ingrese el numero de telefono" v-model="telseller" id="telseller" name="telseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="emailseller">Email</label>
                        <input type="text" class="form-control" placeholder="Ingrese la direccion de correo electronico" v-model="emailseller" id="emailseller" name="emailseller">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-form-label" for="genderseller">Genero</label>
                        <select class="custom-select" v-model="genderseller" id="genderseller" name="genderseller">
                            <option selected="">Seleccione el genero</option>
                            <option value="1">Masculino</option>
                            <option value="2">Femenino</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="borndateseller">Fecha nacimiento</label>
                        <input type="date" class="form-control" v-model="borndateseller" id="borndateseller" name="borndateseller">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="initdateseller">Fecha vinculacion</label>
                        <input type="date" class="form-control" v-model="initdateseller" id="" name="initdateseller" readonly="">
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="journalseller">Jornada</label>
                        <select class="custom-select" v-model="journalseller" id="journalseller" name="journalseller">
                            <option selected="">Seleccione la jornada</option>
                            <option value="1">Matutina</option>
                            <option value="2">Vespertina</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="pass">Password</label>
                        <input type="password" class="form-control" v-model="pass" id="pass" name="pass">
                    </div>

                    <div class="modal-footer">
                    <button  class="btn btn-primary"  v-on:click="createPost">Guardar</button>
                    </div>
                </div>
            </div>
		</div>
    </div>
</template>
<script>
import axios from 'axios';
const _PATH = "/api/vendedores/";

export default {
    name: 'crear',
    data() {
        return {
            error: '',
            text: '',
            elemento: '',
            initdateseller: new Date().toISOString().slice(0,10),
            testButClicked: false,
            url: "http://" + this.$http + ":" + this.$port + _PATH
        }
    },
    methods: {
        testToast() {
            this.testButClicked = true;
        },
        createPost() {
            axios.post(this.url, {
                nombre: this.nameseller,
                apellido: this.lastnameseller,
                direccion: this.dirseller,
                telefono: this. telseller,
                email: this.emailseller,
                genero: this.genderseller,
                fecha_nacimiento: this.borndateseller,
                fecha_vinculacion: this.initdateseller,
                jornada: this.journalseller,
                pass: this.pass
            }).then(() => {
                this.elemento = "Vendedor ["+this.nameseller+"]"
                this.nameseller = ''
                this.lastnameseller = ''
                this.dirseller = ''
                this.telseller = ''
                this.emailseller = ''
                this.genderseller = ''
                this.borndateseller = ''
                this.initdateseller = ''
                this.pass = ''
                this.journalseller = ''
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
<style scoped>
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
</style>