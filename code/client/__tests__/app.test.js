import { mount } from '@vue/test-utils'
import App from './../src/App.vue'
describe('App', () => {
    // Inspect the raw component options
    it('has components', () => {
      expect(typeof App.components).toBe('object')
    })
  })