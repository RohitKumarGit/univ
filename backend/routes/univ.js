const Router = require('express').Router()
const Univ = require('../models/university')
Router.post('/',async (req,res)=>{
    try {
        const univ = await Univ.create(req.body.univ)
        res.send({univ,created:true})
    } catch (error) {
        res.status(400).send({created:false,error})
    }
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