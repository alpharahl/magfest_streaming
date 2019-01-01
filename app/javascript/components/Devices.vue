<template>
  <v-card>
    <v-layout flex>
      <v-flex xs2>
        {{ device.id }}
      </v-flex>
      <v-flex xs3>
        {{ device.location }}
      </v-flex>
      <v-flex xs3>
        {{ device.internal_ip }}
      </v-flex>
      <v-flex xs3>
        <Channel/>
      </v-flex>
      <v-flex xs1>
        <v-btn
          @click="delete_device()"
          icon
          small
          color="error"
          flat
          id="remove"
        >
          <v-icon>remove</v-icon>
        </v-btn>
      </v-flex>
    </v-layout>
  </v-card>
</template>

<script>
  import axios from 'axios'
  import Channel from './channel'

  export default {
    name: "Devices",

    props: ['device'],

    methods: {
      delete_device() {
        axios.destroy('/devices/' + this.device.id)
      }
    },

    mounted () {

    },

    components: {
      Channel
    }
  }
</script>

<style scoped>
.right{
  text-align: right;
}

#remove{
  background-color: red;
  color: white;
}
</style>