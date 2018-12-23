import Vue from 'vue'
import Vuetify from 'vuetify'

Vue.use(Vuetify)

import Setup from '../setup.vue'

import 'vuetify/dist/vuetify.min.css'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('display'))
  const app = new Vue({
    el,
    render: h => h(Setup)
  })

})