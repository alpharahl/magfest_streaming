<template>
  <div id="display">
    <Header/>
    <v-layout row>
      <v-flex xs8>
        Video goes here
      </v-flex>
      <v-flex xs4>
        Schedule here
      </v-flex>
    </v-layout>
    <Footer/>
  </div>
</template>

<script>

import Header from './components/Header'
import Footer from './components/Footer'

export default {
  data: function () {
    return {
    }
  },

  components: {
    Header,
    Footer
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
