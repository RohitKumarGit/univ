<template>
  <div class="container">
    <h1 class="is-size-2 has-text-primary has-text-weight-bold">Students</h1>
    <b-button tag="router-link" to="/add" type="is-success">Add student</b-button>
       <b-table class="mt-4"
            :data="data"
            :columns="columns">
        </b-table>
  </div>
</template>
<script>
export default {
  data(){
    return {
      data :[{
        name
      }]
    }
  }
}
</script>