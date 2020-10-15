import { mount } from '@vue/test-utils'
import component from './../src/components/marca/listar.vue'
describe('Componente listar marca', () => {
  it('se llama marca-listar', () => {
    expect(component.name).toMatch('marca-listar')
  })
  it('tiene data', () => {
    expect(typeof component.data).toBe('function')
  })
  it('tiene metodo mounted', () => {
    expect(typeof component.mounted).toBe('function')
  })
  it('tiene metodos', () => {
    expect(typeof component.methods).toBe('object')
  })
  it('tiene tabla', () => {
    expect(typeof component.methods).toBe('object')
  })
  
})