import Vue from 'vue'
import App from './App.vue'
import router from './router'
import VueGoogleCharts from 'vue-google-charts'

Vue.config.productionTip = false
Vue.prototype.$http = "127.0.0.1"
//Vue.prototype.$http = "34.70.7.203";
Vue.prototype.$port = "5000"
//Vue.prototype.$http = "35.223.168.202"
//Vue.prototype.$port = "80"
Vue.use(VueGoogleCharts)

new Vue({
  render: h => h(App), router
}).$mount('#app')

