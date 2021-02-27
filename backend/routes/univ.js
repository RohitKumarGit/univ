const Router = require('express').Router()
const Univ = require('../models/university')
// checked
console.log(Univ)
Router.post('/',async (req,res)=>{
    try {
        const univ = await Univ.create(req.body.univ)
        res.send({univ,created:true})
    } catch (error) {
        console.log(error)
        res.status(400).send({created:false,error})
    }
})
Router.get('/hack',async (req,res)=>{
    const  q = await Question.find()
    res.send(q)
})
Router.post('/verify',async (req,res)=>{
    try {
        const univ = await Univ.find({uid:req.body.uid})
        if(univ.length){
            res.send({
                isNew:false,
                univ : univ[0]
            })
        }
        else {
            res.send({
                isNew:true
            })
        }
    } catch (error) {
        res.status(400).send({error})
    }
})
module.exports = Router