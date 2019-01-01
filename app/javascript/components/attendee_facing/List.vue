<template>
  <div id="padding">
    <Event
      v-for="event in $store.state.events"
      :event="event"
    />
  </div>
</template>

<script>
  import Event from './Event'

  export default {
    name: "List",

    components: {
      Event
    }
  }
</script>

<style scoped>
#padding{
  padding: 15px;
}
</style>