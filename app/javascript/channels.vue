<template>
  <div>
    <Header :admin="true"/>
    <v-container>
      <DeviceHeader/>
      <Devices v-for="device in devices" :device="device"/>
    </v-container>
    <Footer/>
  </div>
</template>

<script>
  import Header from './components/Header'
  import Footer from './components/Footer'
  import Devices from './components/Devices'
  import DeviceHeader from './components/DeviceHeader'
  import axios from 'axios'

  export default {
    name: "setup",

    components: {
      Header,
      Footer,
      Devices,
      DeviceHeader
    },

    data () {
      return {
        devices: [],
        headers: [
          {
            text: 'ID',
            align: 'right',
            value: 'id'
          },
          {
            text: 'Internal Ip',
            value: 'internal_ip',
            align: 'right'
          },
          {
            text: 'Channel',
            value: 'channel',
            align: 'right'
          }
        ],
      }
    },

    mounted () {
      axios
        .get('/devices')
        .then(response => {
          this.devices = response.data
        })
    }
  }
</script>

<style scoped>

</style>