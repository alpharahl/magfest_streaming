<template>
  <div id="wrapper">

    <v-container fluid v-if="vertical" class="vertLayout">
      <img src="./assets/gaylord_map_-_full.png" class="map"/>
      <List/>
    </v-container>

    <v-layout flex class="layout" v-else>
      <v-flex xs6>
        <img src="./assets/gaylord_map_-_full.png" class="map"/>
      </v-flex>
      <v-flex xs6>
        <List/>
      </v-flex>
    </v-layout>
  </div>
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
        vertical: false
      }
    },

    methods: {
      loadData(data){
        for (var n of data){
          if(n.location.includes('Tabletop') == true || n.location.includes('MITS') == true ){
            this.$store.state.riverview.push(n)
          } else if(
            n.location.includes('Jamspace') ||
            n.location.includes('Autographs') ||
            n.location.includes('Robotics') ||
            n.location.includes('Arcade') ||
            n.location.includes('MIVS') ||
            n.location.includes('Consoles')
          ) {
            this.$store.state.atrium.push(n)
          } else if (
            n.location.includes('Woodrow') ||
            n.location.includes('Chesapeake') ||
            n.location.includes('Maryland') ||
            n.location.includes('Potomac') ||
            n.location.includes('Cherry')
          ) {
            this.$store.state.ballroom.push(n)
          } else if (
            n.location.includes('Harbor')
          ) {
            this.$store.state.harbor.push(n)
          }
        }
        setTimeout(function(){
          this.getData()
        }, 60000)
      },

      getData(){
        axios
          .get('/api/rooms/current')
          .then(response => {
            this.loadData(response.data)
          })
      }
    },

    mounted () {
      this.getData()
    },

    components:{
      List
    }
  }
</script>

<style scoped>
.map{
  height: 100vh;
  padding: 10px;
}

  .layout{
    height: 100vh;
    background-color: black;
    color: lightblue;
  }

  .vertLayout{
    width: 100%;
    background-color: black;
    color: lightblue;
  }

  #wrapper{
    overflow: hidden;
  }

  #welcome{
    font-size: 20px;
    color: #4fc3f7;
    text-align: center;
    width: 100%;
  }
</style>