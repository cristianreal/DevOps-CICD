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
        mounted(){
             if (localStorage.getItem('user') != null){
                this.$router.push('/').catch(()=>{});
                this.$emit('refresh')
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
                        localStorage.setItem('user',JSON.stringify(usuario))
                        if (localStorage.getItem('user') != null){
                            this.$emit('loggedIn')
                            if(this.$route.query.nextUrl != null){
                                this.$router.push(this.$route.query.nextUrl).catch(()=>{});
                                this.$emit('refresh')
                            }
                            else {
                                this.$router.push('/').catch(()=>{});
                                this.$emit('refresh')
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