import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    univ :null
  },
  mutations: {
    addp(c,univ){
      c.univ = univ
    }
  },
  actions: {
  },
  modules: {
  }
})
