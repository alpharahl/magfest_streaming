<template>
  <div id="event" :class="{altColor: index % 2 == 0}">
    <v-layout flex>
      <v-flex xs7>
        {{ name }}
      </v-flex>
      <v-flex xs3>
        {{ magLocation }}
      </v-flex>
      <v-flex xs2 id="time">
        {{ event.start_unix | moment('LT') }} - {{ event.end_unix | moment('LT') }}
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
  export default {
    name: "Event",

    props: ['event', 'index'],

    computed: {
      name () {
        if (this.event.name.length > 80){
          return (this.event.name.substring(0, 77) + '...')
        } else {
          return this.event.name
        }

      },

      location () {
        return '(' + this.event.location.split('(')[1]
      },

      magLocation() {
        var mL = this.event.location.split('(')[0]
        if (mL.includes('Jamspace')){
          mL = 'Jamspace'
        } else if (mL.includes('Mega Man-athon')){
          mL = 'Mega Man-athon'
        } else if (mL.includes('Rock Island')){
          mL = 'Rock Island'
        } else if (mL.includes('D&D')){
          mL = 'D&D Adventurers'
        } else if (mL.includes('Indie Arcade')){
          mL = 'Indie Arcade'
        }
        return mL
      }
    }
  }
</script>

<style scoped>
#event{
  width: 100%;
  padding-bottom: 3px;
  padding-left: 3px;
  padding-right: 3px;
  color: white;
}

#time{
  top: 0px;
  right: 20px;
  text-align: right;
}

.altColor{
  background-color: rgba(15, 32, 65, 0.96);
}
</style>