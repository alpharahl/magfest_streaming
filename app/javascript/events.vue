<template>
  <div>
    <Header :admin="true"/>

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
    }
  }
</script>

<style scoped>

</style>