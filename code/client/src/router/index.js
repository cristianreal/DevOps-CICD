
import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import GetComponent from '@/components/GetComponent'
import contenedor from '@/components/contenedor'
//------------ Marcas ------------------------------
import marcarListarComponent from '@/components/marca/listar'
import marcaCrearComponent from '@/components/marca/crear'
import marcaEditarComponent from '@/components/marca/editar'
//----------- Proveedor -----------------------------
import proveedorListarComponent from '@/components/proveedor/listar'
import proveedorCrearComponent from '@/components/proveedor/crear'

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
            component: contenedor,
            children: [
                {
                    path: 'crear',
                    component: marcaCrearComponent
                },
                {
                    path: 'listar',
                    component: marcarListarComponent
                },
                {
                    path: 'editar/:pkmarca',
                    component: marcaEditarComponent
                }
            ]
        },
        {
            path: '/proveedor/', 
            component: contenedor,
            children: [
                {
                    path: 'crear',
                    component: proveedorCrearComponent
                },
                {
                    path: 'listar',
                    component: proveedorListarComponent
                }
            ]
        }
    ]
})