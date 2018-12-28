<template>
  <div>
    <Header :admin="true"/>
    <v-container>
      <EventStream v-for="stream in streams" :stream="stream"/>
    </v-container>
    <Footer/>
  </div>
</template>

<script>
  import Header from './components/Header'
  import Footer from './components/Footer'
  import EventStream from './components/EventStream'
  import axios from 'axios'

  export default {
    name: "setup",

    components: {
      Header,
      Footer,
      EventStream
    },

    data () {
      return {
        streams: []
      }
    },

    mounted () {
      axios
        .get('/api/admin/events')
        .then(response => {
          this.streams = response.data
        })
    }
  }
</script>

<style scoped>

</style>