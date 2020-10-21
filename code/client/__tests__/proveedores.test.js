import { shallowMount } from '@vue/test-utils'
import listar from './../src/components/proveedor/listar.vue'
import crear from './../src/components/proveedor/crear.vue'
import editar from './../src/components/proveedor/editar.vue'
import detalle from './../src/components/proveedor/detalle.vue'

/**
 * Test componente listar proveedor
 */
describe('Componente listar proveedor', () => {
    it('se llama proveedor-listar', () => {
        expect(listar.name).toMatch('proveedor-listar')
    })
    it('tiene data', () => {
        expect(typeof listar.data).toBe('function')
    })
    it('tiene metodos', () => {
        expect(typeof listar.methods).toBe('object')
    })
    it('tiene metodo mounted', () => {
        expect(typeof listar.mounted).toBe('function')
    })
})

/**
 * Test componente crear proveedor
 */
describe('Componente crear proveedor', () => {
    it('se llama proveedor-crear', () => {
        expect(crear.name).toMatch('proveedor-crear')
    })
    it('tiene data', () => {
        expect(typeof crear.data).toBe('function')
    })
    it('tiene metodos', () => {
        expect(typeof crear.methods).toBe('object')
    })
})

/**
 * Test componente editar proveedor
 */
describe('Componente editar proveedor', () => {
    it('se llama proveedor-editar', () => {
        expect(editar.name).toMatch('proveedor-editar')
    })
    it('tiene data', () => {
        expect(typeof editar.data).toBe('function')
    })
    it('tiene metodos', () => {
        expect(typeof editar.methods).toBe('object')
    })
    it('tiene metodo mounted', () => {
        expect(typeof editar.mounted).toBe('function')
    })
})

/**
 * Test componente detalle proveedor
 */
describe('Componente detalle proveedor', () => {
    it('se llama proveedor-detalle', () => {
        expect(detalle.name).toMatch('proveedor-detalle')
    })
    it('tiene data', () => {
        expect(typeof detalle.data).toBe('function')
    })
    it('tiene metodos', () => {
        expect(typeof detalle.methods).toBe('object')
    })
    it('tiene metodo mounted', () => {
        expect(typeof detalle.mounted).toBe('function')
    })
})