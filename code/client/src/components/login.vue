<template>
	<div class="container">
		<div class="jumbotron">
            <h1>Login</h1>
            <div class="form-group">
            <input type="text" class="form-control" name="username" v-model="input.username" placeholder="Username" />
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
                    username: "",
                    password: ""
                }
            }
        },
        methods: {
            login() {
                if(this.input.username != "" && this.input.password != "") {
                    if(this.input.username == "Admin" && this.input.password == "123456") {
                        this.$emit("authenticated", true);
                        this.$router.replace({ name: "secure" });
                    } else {
                        console.log("The username and / or password is incorrect");
                    }
                } else {
                    console.log("A username and password must be present");
                }
            }
        }
    }
</script>