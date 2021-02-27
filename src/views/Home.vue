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
import axios from 'axios'
export default {
  data(){
    return {
      data :[{
        name:"Rohit Kumar",
        roll:"2019UCS2001",
        credits :100
      }],
      columns :[{
        field:"name",
        label:"NAME",
        searchable:true
      },{
        field:"roll",
        label:"ROLL NUMBER",
        searchable:true
      },{
        field:"credits",
        label:"CURRENT CREDITS",
        searchable:true,
        numeric:true
      }]
    }
  },
  methods:{
    async getData(){
      const {data} = await axios.get('https://hackverse.herokuapp.com/api/student/all')
      console.log(data)
    }
  },
  created(){
    this.getData()
  }
}
</script>
