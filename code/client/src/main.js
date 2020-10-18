import Vue from 'vue'
import App from './App.vue'
import router from './router'
import VueGoogleCharts from 'vue-google-charts'
import VueSweetalert2 from 'vue-sweetalert2';
import VueIziToast from "vue-izitoast";
import DataTable from "vue-materialize-datatable";
import "izitoast/dist/css/iziToast.css";

Vue.config.productionTip = false;
Vue.prototype.$http = "https://backend.poliformas.com.gt";
Vue.prototype.$port = "443";

Vue.use(VueIziToast);
Vue.use(VueGoogleCharts)
Vue.use(VueSweetalert2);

Vue.component('datatable', DataTable)

new Vue({
  render: h => h(App), router
}).$mount('#app')

