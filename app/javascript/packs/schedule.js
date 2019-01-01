import Vue from 'vue'
import Vuetify from 'vuetify'
import Vuex from 'vuex'

Vue.use(Vuetify)
Vue.use(Vuex)
Vue.use(require('vue-moment'));

import Schedule from '../schedule.vue'

import 'vuetify/dist/vuetify.min.css'

const store = new Vuex.Store({
  state: {
    events: []
  }
})

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('schedule'))
  const app = new Vue({
    el,
    store,
    render: h => h(Schedule)
  })

})