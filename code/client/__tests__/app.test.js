import { mount } from '@vue/test-utils'
import App from './../src/App.vue'
import NavBar from './../src/components/NavBar.vue'

describe('App', () => {
    // Inspect the raw component options
    it('tiene comoenentes', () => {
      expect(typeof App.components).toBe('object')
    })
    it('tiene Navbar', () => {
      const expected = { NavBar }
      expect(App.components).toMatchObject(expected)
    })
    it('se llama app', () => {
      expect(App.name).toMatch('App')
    })
})