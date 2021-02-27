<template>
    <div class="login">
        <b-button type="is-primary" v-on:click="login">LOGIN WITH GOOGLE</b-button>
    </div>
</template>
<style scoped lang="scss">
.login{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
</style>
<script>
import firebase from 'firebase'
import axios from 'axios'
export default {
    
    methods:{
        async login(){
            var provider = new firebase.auth.GoogleAuthProvider();
            try {
                const {user} = await firebase.auth().signInWithPopup(provider)
                const {data} = await axios.post('https://hackverse.herokuapp.com/api/univ/verify',{
                    uid:user.uid
                })
                if(data.isNew){
                    const {data2} = await axios.post('https://hackverse.herokuapp.com/api/univ/',{
                    uid:user.uid,
                    name :user.email,
                    email:user.email
                    })
                    this.$store.commit("addp",data2.univ)
                }
                else {
                    this.$store.commit("addp",data.univ)
                }
            } catch (error) {
                alert(error.message)
            }
            

        }
    }
}
</script>