<template>
	<div class="container">
		<div class="jumbotron">
            <h1>Login</h1>
            <div class="form-group">
            <input type="text" class="form-control" name="email" v-model="input.email" placeholder="email" />
            </div>
            <div class="form-group">
            <input type="password" class="form-control" name="password" v-model="input.password" placeholder="Password" />
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
                url: "http://" + this.$http + ":" + this.$port + _PATH
            }
        },
        methods: {
            login() {
                if(this.input.email != "" && this.input.password != "") {
                    console.log(this.url+"login")
                    axios.post(this.url+"login", {
                    email: this.input.email,
                    password: this.input.password
                    }).then(result => {
                        let usuario = result.data[0][0]
                        //console.log(usuario)
                        //let is_admin = response.data.user.is_admin
                        localStorage.setItem('user',JSON.stringify(usuario))
                        console.log(localStorage.getItem('user'))
                        if (localStorage.getItem('user') != null){
                            this.$emit('loggedIn')
                            this.$emit('authenticated',true)
                            if(this.$route.params.nextUrl != null){
                                this.$router.push(this.$route.params.nextUrl)
                            }
                            else {
                                 this.$router.push('')
                             /*   if(is_admin== 1){
                                    this.$router.push('admin')
                                }
                                else {
                                    this.$router.push('dashboard')
                                }*/
                            }
                        }
                    }).catch((error) => {
                        console.error(error)
                        return;
                    })
                    
                } else {
                    console.log("A email and password must be present");
                }
            }
        }
    }
</script>