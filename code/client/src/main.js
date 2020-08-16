import Vue from 'vue'
import App from './App.vue'
import router from './router'
import VueGoogleCharts from 'vue-google-charts'
import VueSweetalert2 from 'vue-sweetalert2';
import VueIziToast from "vue-izitoast";
import "izitoast/dist/css/iziToast.css";

Vue.config.productionTip = false
//Vue.prototype.$http = process.env.VUE_APP_API_IP;
//Vue.prototype.$port = process.env.VUE_APP_API_PORT;
Vue.prototype.$http = "localhost";
Vue.prototype.$port = "5000";

Vue.use(VueIziToast);
Vue.use(VueGoogleCharts)
Vue.use(VueSweetalert2);
new Vue({
  render: h => h(App), router
}).$mount('#app')

