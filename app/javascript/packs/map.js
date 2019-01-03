import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '../streaming_vue/src/App.vue'
import store from '../streaming_vue/src/store'
import {router} from '../streaming_vue/src/routes'


Vue.config.productionTip = false

store.dispatch('Cells/getCells')

Vue.use(Vuetify)


document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('schedule'))
  const app = new Vue({
    el,
    store,
    router,
    render: h => h(App)

  })
})