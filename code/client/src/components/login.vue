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
    export default {
        name: 'Login',
        data() {
            return {
                input: {
                    email: "",
                    password: ""
                }
            }
        },
        methods: {
            login() {
                if(this.input.email != "" && this.input.password != "") {
                    axios.post(this.url, {
                    email: this.email,
                    password: this.password
                    }).then(result => {
                        let usuario = result.data[0]
                        console.log(usuario)
                       /* let is_admin = response.data.user.is_admin
                        localStorage.setItem('user',JSON.stringify(response.data.user))
                        localStorage.setItem('jwt',response.data.token)

                        if (localStorage.getItem('jwt') != null){
                            this.$emit('loggedIn')
                            if(this.$route.params.nextUrl != null){
                                this.$router.push(this.$route.params.nextUrl)
                            }
                            else {
                                if(is_admin== 1){
                                    this.$router.push('admin')
                                }
                                else {
                                    this.$router.push('dashboard')
                                }
                            }
                        }*/
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