<template>
  <v-flex xs4>
    <v-card id="deviceCard" :class="{deleted: deleted}">
      Device Id: {{ device.id }}
      <br>
      Internal IP:
      <v-text-field solo label="internal ip" single-line v-model="device.internal_ip"/>
      Location:
      <v-text-field solo v-model="device.location"/>
      Channel:
      <v-text-field solo v-model="device.channel"/>
    </v-card>
    <div id="buttons">

      <v-btn fab dark small id="delete" @click="deleteDevice()">
        <v-icon dark>remove</v-icon>
      </v-btn>
      <v-btn fab light small id="save" @click="saveDevice()">
        <v-icon light>save</v-icon>
      </v-btn>
    </div>
  </v-flex>
</template>

<script>
  import axios from 'axios'

  export default {
    name: "DeviceSetupCard",

    data () {
      return {
        deleted: false
      }
    },

    props: ['device'],

    methods: {
      deleteDevice(){
        axios
          .delete('/devices/' + this.device.id)
          .then(respones => {
            this.deleted = true
          })
      },

      saveDevice: function () {
        axios
          .patch(
            '/devices/' + this.device.id,
            {
              internal_ip: this.device.internal_ip,
              location: this.device.location,
              channel: this.device.channel
            }
          )
      }
    }
  }
</script>

<style scoped>
#deviceCard{
  background-color: rgb(25,25,25);
  color: whitesmoke;
  padding: 15px;
}

#delete{
  color: black;
  background-color: red
}

.deleted{
  text-decoration: line-through
}

#buttons{
  text-align: center;
}

#save{
  background-color: lightgreen
}
</style>