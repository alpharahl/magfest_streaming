<template>
  <div>
    <h2>{{floorName}}</h2>
    <Event v-for="(event, ind) in events" :event="event" :index="ind"/>
  </div>
</template>

<script>
  import Event from './Event'

  export default {
    name: "Floor",

    props: ['floorName', 'events'],

    components: {
      Event
    }
  }
</script>

<style scoped>

</style>