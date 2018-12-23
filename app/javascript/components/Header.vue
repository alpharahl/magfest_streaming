<template>
    <v-toolbar
      dark
      color="rgb(26,26,26)"
      id="header"
    >
        <h1>MAGFest 2019</h1>
        <v-spacer></v-spacer>
        <div v-if="admin">
            <v-btn light @click="refreshEvents()">RePopulate Events</v-btn>
        </div>
    </v-toolbar>
</template>

<script>
import axios from 'axios'
export default {
  name: "Header",
  props: ['admin'],

  methods: {
    refreshEvents() {
      axios.get('/api/admin/populate')
    }
  }
}
</script>

<style scoped>
#header{
    color: orange;
    padding: 10px;
}
</style>