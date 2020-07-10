
import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import GetComponent from '@/components/GetComponent'
import marcaComponent from '@/components/marca/marca'
import marcarListarComponent from '@/components/marca/listar'
import marcaCrearComponent from '@/components/marca/crear'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'POST',
            component: Home
        },
        {
            path: '/GET',
            name: 'GET',
            component: GetComponent,
        },
        {
            path: '/marca/', 
            component: marcaComponent,
            children: [
                {
                    path: 'crear',
                    component: marcaCrearComponent
                },
                {
                    path: 'listar',
                    component: marcarListarComponent
                }
            ]
        }
    ]
})