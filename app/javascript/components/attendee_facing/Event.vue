<template>
  <div id="event">

    <v-layout flex>
      <v-flex xs9>
        <div id="name">
          {{event.name}}
        </div>
      </v-flex>
      <v-flex xs3 id="time">
        {{magLocation}}
        <br>
        <span style="font-size: smaller">{{location}}</span>
        <br>
        {{event.start_unix | moment('LT')}}-{{event.end_unix | moment('LT')}}
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
  export default {
    name: "Event",

    props: ['event'],

    computed: {
      name () {
        if (this.event.name.length > 50){
          return (this.event.name.substring(0, 47) + '...')
        } else {
          return this.event.name
        }

      },

      location () {
        return '(' + this.event.location.split('(')[1]
      },

      magLocation() {
        return this.event.location.split('(')[0]
      }
    }
  }
</script>

<style scoped>
#event{
  width: 100%;
  border-bottom: solid 1px teal;
  padding-bottom: 3px;
}

#time{
  top: 0px;
  right: 20px;
  text-align: right;
  font-size: larger;
}

#name{
  color: lightblue;
  font-size: 24px;
  width: 70%;
  overflow:hidden;
}

#color{
  background-color: rgb(255,157,157);
  width: 20px;
  height: 100$;
}
</style>