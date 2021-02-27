const Router = require('express').Router()
const Sessions = require('../models/sessions')
const Student = require('../models/student')
Router.post('/',async (req,res)=>{
    try {
        const session = await Sessions.create(req.body)
        res.send({
            session,
            created:true
        })
    } catch (error) {
        res.send({
            error,
            created:false
            
        })
    }
})
Router.post('/rate',async (req,res)=>{
    try {
        var  session = await Sessions.findOne(req.body.session_id)
        session.nrated +=1
        session.ratings = (session.ratings + req.body.rating) / session.nrated
        session = await session.save()
        res.send({
            session
        })
    } catch (error) {
        res.send({
            error,
           
            
        })
    }
})

Router.post('/rsvp',async (req,res)=>{
    try {
        var  session = await Sessions.findOne(req.body.session_id)
        session.rsvp  = true
        session = await session.save()
        res.send({
            session
        })
    } catch (error) {
        res.send({
            error,
           
            
        })
    }
})
Router.post('/cancel',async (req,res)=>{
    try {
        var  session = await Sessions.findOne(req.body.session_id)
        session.cancelled = true
        session = await session.save()
        res.send({
            session
        })
    } catch (error) {
        res.send({
            error,
           
            
        })
    }
})

Router.post('/done',async (req,res)=>{
    try {
        var  session = await Sessions.findOne(req.body.session_id)
        session.done = true
        const inst  = session.student
        const student = await Student.findById(inst)
        student.credits += session.credit*session.attendees.length
        session.attendees.forEach(async v=>{
            const s  = await Student.findById(v)
            s.credits -= session.credit
            await s.save()
        })
        session = await session.save()
        
        res.send({
            session
        })
    } catch (error) {
        res.send({
            error,
           
            
        })
    }
})