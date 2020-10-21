import { shallowMount } from '@vue/test-utils'
import listar from './../src/components/producto/listar.vue'
import crear from './../src/components/producto/crear.vue'
import editar from './../src/components/producto/editar.vue'
import detalle from './../src/components/producto/detalle.vue'

/**
 * Test componente listar producto
 */
describe('Componente listar producto', () => {
    it('se llama producto-listar', () => {
        expect(listar.name).toMatch('producto-listar')
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
 * Test componente crear producto
 */
describe('Componente crear producto', () => {
    it('se llama producto-crear', () => {
        expect(crear.name).toMatch('producto-crear')
    })
    it('tiene data', () => {
        expect(typeof crear.data).toBe('function')
    })
    it('tiene metodos', () => {
        expect(typeof crear.methods).toBe('object')
    })
})

/**
 * Test componente editar producto
 */
describe('Componente editar producto', () => {
    it('se llama producto-editar', () => {
        expect(editar.name).toMatch('producto-editar')
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
 * Test componente detalle producto
 */
describe('Componente detalle producto', () => {
    it('se llama producto-detalle', () => {
        expect(detalle.name).toMatch('producto-detalle')
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