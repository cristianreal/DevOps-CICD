
import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import contenedor from '@/components/contenedor'
//------------ Marcas ------------------------------
import marcarListarComponent from '@/components/marca/listar'
import marcaCrearComponent from '@/components/marca/crear'
import marcaEditarComponent from '@/components/marca/editar'
import marcaDetalleComponent from '@/components/marca/detalle'
//----------- Proveedor -----------------------------
import proveedorListarComponent from '@/components/proveedor/listar'
import proveedorCrearComponent from '@/components/proveedor/crear'
import proveedorEditarComponent from '@/components/proveedor/editar'
import proveedorDetalleComponent from '@/components/proveedor/detalle'
//----------- Vendedor -----------------------------
import vendedorListarComponent from '@/components/vendedor/listar'
import vendedorCrearComponent from '@/components/vendedor/crear'
import vendedorEditarComponent from '@/components/vendedor/editar'
import vendedorDetalleComponent from '@/components/vendedor/detalle'
//----------- Prooducto ------------------------------
import productoListarComponent from '@/components/producto/listar'
import productoCrearComponent from '@/components/producto/crear'
import productoEditarComponent from '@/components/producto/editar'
import productoDetalleComponent from '@/components/producto/detalle'
//----------- Movimiento ------------------------------
import movimientoIngresoComponent from '@/components/movimiento/ingreso'
import movimientoIngresoListComponent from '@/components/movimiento/ingreso_listar'
import movimientoIngresoDetailComponent from '@/components/movimiento/ingreso_detalle'
import movimientoEgresoComponent from '@/components/movimiento/egreso'
import movimientoEgresoListComponent from '@/components/movimiento/egreso_listar'
import movimientoEgresoDetailComponent from '@/components/movimiento/egreso_detalle.vue'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'POST',
            component: Home
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
                    path: 'detalle/:pkmarca',
                    component: marcaDetalleComponent
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
                },
                {
                    path: 'detalle/:pkproveedor',
                    component: proveedorDetalleComponent
                },
                {
                    path: 'editar/:pkproveedor',
                    component: proveedorEditarComponent
                }
            ]
        },
        {
            path: '/vendedor/', 
            component: contenedor,
            children: [
                {
                    path: 'crear',
                    component: vendedorCrearComponent
                },
                {
                    path: 'listar',
                    component: vendedorListarComponent
                },
                {
                    path: 'detalle/:pkvendedor',
                    component: vendedorDetalleComponent
                },
                {
                    path: 'editar/:pkvendedor',
                    component: vendedorEditarComponent
                }
            ]
        },
        {
            path: '/producto/', 
            component: contenedor,
            children: [
                {
                    path: 'crear',
                    component: productoCrearComponent
                },
                {
                    path: 'listar',
                    component: productoListarComponent
                },
                {
                    path: 'detalle/:pkproducto',
                    component: productoDetalleComponent
                },
                {
                    path: 'editar/:pkproducto',
                    component: productoEditarComponent
                }
            ]
        },
        {
            path: '/movimiento/', 
            component: contenedor,
            children: [
                {
                    path: 'ingreso',
                    component: movimientoIngresoComponent
                },
                {
                    path: 'ingreso/detalle/:pkmovimiento',
                    component: movimientoIngresoDetailComponent
                },
                {
                    path: 'ingreso/listar',
                    component: movimientoIngresoListComponent
                },
                {
                    path: 'egreso',
                    component: movimientoEgresoComponent
                },
                {
                    path: 'egreso/detalle/:pkmovimiento',
                    component: movimientoEgresoDetailComponent
                },
                {
                    path: 'egreso/listar',
                    component: movimientoEgresoListComponent
                }
            ]
        }
    ]
})