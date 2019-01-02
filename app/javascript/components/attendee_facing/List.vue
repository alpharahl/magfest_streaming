<template>
  <div id="padding">
    <Floor floorName="National Harbor Level" :events="$store.state.harbor"/>
    <Floor floorName="Ballroom Level" :events="$store.state.ballroom"/>
    <Floor floorName="Atrium Level" :events="$store.state.atrium"/>
    <Floor floorName="Riverview Ballroom" :events="$store.state.riverview"/>
  </div>
</template>

<script>
  import Floor from './Floor'

  export default {
    name: "List",

    components: {
      Floor
    }
  }
</script>

<style scoped>
#padding{
  padding: 15px;
}
</style>