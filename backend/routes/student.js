const Router = require('express').Router()
const Student = require('../models/student')
Router.post('/',async (req,res)=>{
    try {
        const student = await Student.create(req.body.student)
        res.send({
            created:true,
            student
        })
    } catch (error) {
        res.status(400).send({error})
    }
})
Router.get('/',async (req,res)=>{
    try {
        const student = await Student.findOne(req.body.uid)
        res.send({
            
            student
        })
    } catch (error) {
        res.status(400).send({error})
    }
})