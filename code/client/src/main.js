import Vue from 'vue'
import App from './App.vue'
import router from './router'

Vue.config.productionTip = false
Vue.prototype.$http = "127.0.0.1"
Vue.prototype.$port = "5000"

new Vue({
  render: h => h(App), router
}).$mount('#app')

