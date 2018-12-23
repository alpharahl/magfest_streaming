<template>
  <div id="setup">
    <Header/>
    <Setup/>
    <Footer/>
  </div>
</template>

<script>
  import Header from './components/Header'
  import Footer from './components/Footer'
  import Setup from './components/Setup'

  export default {
    name: "setup",

    components: {
      Header,
      Footer,
      Setup
    }
  }
</script>

<style scoped>

</style>