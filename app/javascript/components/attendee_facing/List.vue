<template>
  <div id="padding">
    <Floor
      floorName="National Harbor Level"
      :events="$store.state.harbor"
      v-if="$store.state.harbor.length > 0"
    />
    <Floor
      floorName="Ballroom Level"
      :events="$store.state.ballroom"
      v-if="$store.state.ballroom.length > 0"
    />
    <Floor
      floorName="Atrium Level"
      :events="$store.state.atrium"
      v-if="$store.state.atrium.length > 0"
    />
    <Floor
      floorName="Riverview Ballroom"
      :events="$store.state.riverview"
      v-if="$store.state.riverview.length > 0"
    />
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
  overflow-y: hidden;
}
</style>