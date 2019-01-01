<template>
  <v-container>

    <v-combobox
      :items="channels"
      v-model="current"
      solo
    ></v-combobox>
  </v-container>
</template>

<script>
  import axios from 'axios'
  export default {
    name: "channel",

    data () {
      return {
        channels: [],
        current: 'item 1'
      }
    },

    props: ['id'],

    mounted () {
      axios
        .get('/api/rooms/streamable')
        .then(response => {
          for (var c of response.data){
            this.channels.push(c.name)
          }
        })
    }
  }
</script>

<style scoped>

</style>