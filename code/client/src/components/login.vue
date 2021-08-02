<template>
	<div class="container">
		<div class="jumbotron">
            <h1>Login V2</h1>
            <div class="form-group">
            <input type="text" class="form-control" name="email" v-model="input.email" placeholder="email" />
            </div>
            <div class="form-group">
            <input type="password" class="form-control" name="password" v-model="input.password"/>
            </div>
            <div class="form-group">
            <button type="button"  class="btn btn-primary" v-on:click="login()">Login</button>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';
const _PATH = "/api/vendedores/";

    export default {
        name: 'Login',
        data() {
            return {
                input: {
                    email: "",
                    password: ""
                },
                url: this.$http + ":" + this.$port + _PATH
            }
        },
        mounted(){
             if (localStorage.getItem('user') != null){
                this.$router.push('/').catch(()=>{});
                this.$emit('refresh')
             }
        },
        methods: {
            login() {
                if(this.input.email != "" && this.input.password != "") {
                    axios.post(this.url+"login", {
                        email: this.input.email,
                        password: this.input.password
                    }).then(result => {
                        let respuesta = result.data[0];
                        if(respuesta.length == 0){
                            this.$swal('El usuario/password es incorrecto!!!');
                            this.input.password = "";
                            return;
                        }
                        let usuario = respuesta[0]
                        localStorage.setItem('user',JSON.stringify(usuario))
                        if (localStorage.getItem('user') != null){
                            this.$emit('loggedIn')
                            if(this.$route.query.nextUrl != null){
                                this.$router.push(this.$route.query.nextUrl).catch(()=>{});
                            }
                            else {
                                this.$router.push('/').catch(()=>{});
                            }
                        }
                        this.$router.go()
                    }).catch((error) => {
                        console.error(error)
                        return;
                    })
                    
                } else {
                    this.$swal('Es obligatorio ingresar el email y password!!!');
                }
            }
        }
    }
</script>