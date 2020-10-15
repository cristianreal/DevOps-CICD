import Vue from 'vue'
import { mount } from '@vue/test-utils'
import NavBar from './components/NavBar.vue'

import DataTable from 'vue-materialize-datatable'
import component from './../src/components/marca/listar.vue'

test('displays message', () => {
    Vue.prototype.$http = "https://poliformas.com.gt";
Vue.prototype.$port = "443";

Vue.component('datatable', DataTable)
    const wrapper = mount(component)
    // mount() returns a wrapped Vue component we can interact with
  //  const wrapper = mount(component, {
  //    propsData: {
  //      msg: 'Hello world'
  //    }
  //  })
  console.log(wrapper.text);
  //
  //  // Assert the rendered text of the component
  //  expect(wrapper.text()).toContain('Hello world')
  })
  