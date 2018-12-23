<template>
  <v-content id="setupContent">
    <v-layout flex wrap>
      <Device v-for="device in devices"
              :device="device"
      />
    </v-layout>
  </v-content>
</template>

<script>
  import axios from 'axios'

  import Device from './DeviceSetupCard'

  export default {
    name: "Setup",

    data () {
      return {
        devices: {}
      }
    },

    mounted () {
      axios.get('/api/admin/devices')
        .then(response =>  {
          this.devices = response.data
        }
      )
    },

    components: {
      Device
    }
  }
</script>

<style scoped>
#setupContent{
  background-color: rgb(25,25,25);
  color: white;
  height: 100%;
}
</style>