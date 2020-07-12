import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false
//Vue.prototype.$http = "127.0.0.1"
//Vue.prototype.$port = "5000"
Vue.prototype.$http = "34.69.252.180"
Vue.prototype.$port = "80"

new Vue({
  render: h => h(App), router
}).$mount('#app')

