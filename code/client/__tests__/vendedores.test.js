import { shallowMount } from '@vue/test-utils'
import listar from './../src/components/vendedor/listar.vue'
import crear from './../src/components/vendedor/crear.vue'
import editar from './../src/components/vendedor/editar.vue'
import detalle from './../src/components/vendedor/detalle.vue'

/**
 * Test componente listar vendedor
 */
describe('Componente listar vendedor', () => {
    it('se llama vendedor-listar', () => {
        expect(listar.name).toMatch('vendedor-listar')
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
 * Test componente crear vendedor
 */
describe('Componente crear vendedor', () => {
    it('se llama vendedor-crear', () => {
        expect(crear.name).toMatch('vendedor-crear')
    })
    it('tiene data', () => {
        expect(typeof crear.data).toBe('function')
    })
    it('tiene metodos', () => {
        expect(typeof crear.methods).toBe('object')
    })
})

/**
 * Test componente editar vendedor
 */
describe('Componente editar vendedor', () => {
    it('se llama vendedor-editar', () => {
        expect(editar.name).toMatch('vendedor-editar')
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
 * Test componente detalle vendedor
 */
describe('Componente detalle vendedor', () => {
    it('se llama vendedor-detalle', () => {
        expect(detalle.name).toMatch('vendedor-detalle')
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