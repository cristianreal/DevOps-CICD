import { mount } from '@vue/test-utils'
import component from './../src/App.vue'
import NavBar from './../src/components/NavBar.vue'

describe('App', () => {
  // Inspect the raw component options
  it('tiene componentes', () => {
    expect(typeof component.components).toBe('object')
  })
  it('tiene Navbar', () => {
    const expected = { NavBar }
    expect(component.components).toMatchObject(expected)
  })
  it('se llama app', () => {
    expect(component.name).toMatch('App')
  })
})