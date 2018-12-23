import Vue from 'vue'
import Vuetify from 'vuetify'

Vue.use(Vuetify)

import Events from '../events.vue'

import 'vuetify/dist/vuetify.min.css'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('events'))
  const app = new Vue({
    el,
    render: h => h(Events)
  })

})