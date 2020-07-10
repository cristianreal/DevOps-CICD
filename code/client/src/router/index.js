
import Vue from 'vue'
import Router from 'vue-router'
import PostComponent from '@/components/PostComponent'
import GetComponent from '@/components/GetComponent'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'POST',
      component: PostComponent
    },
    {
      path: '/GET',
      name: 'GET',
      component: GetComponent,
    }
  ]
})