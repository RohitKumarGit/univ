<template>
    <div class="container">
    <h1 class="is-size-2 has-text-primary has-text-weight-bold">Sessions</h1>
   
       <b-table class="mt-4"
            :data="data"
            :columns="columns">

            <b-table-column field="title"></b-table-column>
        </b-table>
  </div>
</template>
<script>
export default {
    
}
</script>