import { shallowMount } from '@vue/test-utils'
import listar from './../src/components/marca/listar.vue'
import crear from './../src/components/marca/crear.vue'
import editar from './../src/components/marca/editar.vue'
import detalle from './../src/components/marca/detalle.vue'

/**
 * Test componente listar marca
 */
describe('Componente listar marca', () => {
  it('se llama marca-listar', () => {
    expect(listar.name).toMatch('marca-listar')
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
 * Test componente crear marca
 */
describe('Componente crear marca', () => {
  it('se llama marca-crear', () => {
    expect(crear.name).toMatch('marca-crear')
  })
  it('tiene data', () => {
    expect(typeof crear.data).toBe('function')
  })
  it('tiene metodos', () => {
    expect(typeof crear.methods).toBe('object')
  })
})

/**
 * Test componente editar marca
 */
describe('Componente editar marca', () => {
  it('se llama marca-editar', () => {
    expect(editar.name).toMatch('marca-editar')
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
 * Test componente detalle marca
 */
describe('Componente detalle marca', () => {
  it('se llama marca-detalle', () => {
    expect(detalle.name).toMatch('marca-detalle')
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