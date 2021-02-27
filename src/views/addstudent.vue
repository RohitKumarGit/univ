<template>
  <div class="container">
    <h1 class="is-size-2 has-text-primary has-text-weight-bold">Add Students</h1>
    <div class="container">
        Enter Student Details
        <b-field label="Name">
            <b-input v-model="name"></b-input>
        </b-field>
        <b-field label="Roll">
            <b-input v-model="roll"></b-input>
        </b-field>
        <b-field label="Email">
            <b-input v-model="email"></b-input>
        </b-field>
    </div>
    <b-button type="is-primary" class="mt-3" on:click="post">POST</b-button>
  </div>
</template>
<script>
import axios from 'axios'
export default {
    data(){
        return {
            name :"",
            roll:"",
            email:"",
            univ :"abc"
        }
    },
    methods:{
        async post(){
            const data = {
                name :this.name,
                roll:this.roll,
                email:this.roll,
                univ:this.univ._id
            }
            try {
                const {datad} = await axios.post('https://hackverse.herokuapp.com/api/student',data)
                console.log(datad)
                this.$router.push('/')
            } catch (error) {
                console.log(error)
            }
            
        }
    }
}
</script>