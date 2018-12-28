<template>
  <v-card id="events">
    <v-layout flex>
      <v-flex xs5>
        {{ stream.name }}
      </v-flex>
      <v-flex xs5>
        <v-text-field
          solo
          v-model="link"
        />
      </v-flex>
      <v-flex xs2 style="padding: 5px;">
        <v-switch
          :label="'Streaming'"
          v-model="streaming"
        >
        </v-switch>
      </v-flex>
    </v-layout>

  </v-card>
</template>

<script>
  import axios from 'axios'

  export default {
    name: "EventStream",

    props: ['stream'],

    data () {
      return {
        streaming: false,
        link: ''
      }
    },

    mounted () {
      this.streaming = this.stream.streaming
      this.link = this.stream.link
    },

    watch: {
      link () {
        axios.patch(
          '/api/rooms/' + this.stream.id,
          {
            'link': this.link
          }
        )
      },
      streaming () {
        axios.patch(
          '/api/rooms/' + this.stream.id,
          {
            'streaming': this.streaming
          }
        )
      }
    }
  }
</script>

<style scoped>
#events{
  font-size: small
}
</style>