<template>
  <div id="app">
    <navbar v-if="$route.name != 'login'"></navbar>
    <router-view/>
  </div>
</template>
<script>
import navbar from '@/components/navbar'
export default {
  components:{
    navbar
  }
}
</script>


