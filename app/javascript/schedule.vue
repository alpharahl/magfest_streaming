<template>
  <v-layout flex class="layout">
    <v-flex xs5>
      <img src="./assets/gaylord_map_-_full.png" class="map"/>
    </v-flex>
    <v-flex xs7>
      <List/>
    </v-flex>
  </v-layout>
</template>

<script>
  import axios from 'axios'
  import List from './components/attendee_facing/List'

  export default {
    name: "schedule",

    components: {
    },

    data () {
      return {

      }
    },

    methods: {
      iterate(){
        var first = this.$store.state.events.shift()
        this.$store.state.events.push(first)
        setTimeout( _ => this.iterate(), 5000)
      }
    },

    mounted () {
      axios
        .get('/api/rooms/current')
        .then(response => {
          this.$store.state.events = response.data
          setTimeout( _ => this.iterate(), 5000)
        })
    },

    components:{
      List
    }
  }
</script>

<style scoped>
.map{
  width: 100%;
  height: auto;
  padding: 10px;
}

  .layout{
    height: 100vh;
    background-color: black;
    color: lightblue;
  }
</style>