import Vue from 'vue'
import Vuetify from 'vuetify'

Vue.use(Vuetify)

import Channels from '../channels.vue'

import 'vuetify/dist/vuetify.min.css'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('channels'))
  const app = new Vue({
    el,
    render: h => h(Channels)
  })

})