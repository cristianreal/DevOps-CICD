import { mount } from '@vue/test-utils'
import App from './../src/components/marca/listar.vue'
describe('App', () => {
  it('has data', () => {
    expect(typeof App.data).toBe('function')
  })
})
describe('App', () => {
  it('has methods', () => {
    expect(typeof App.methods).toBe('object')
  })
})