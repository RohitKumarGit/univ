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
Router.get('/teaching',async (req,res)=>{
    try {
        const sessions = await Sessions.find({
            univ : req.query.univ_id,
            teaching:true
        }).populate("student attendees")
        res.send({
            sessions
           
        })
    } catch (error) {
        res.send({
            error
          
            
        })
    }
})
Router.get('/discussion',async (req,res)=>{
    try {
        const sessions = await Sessions.find({
            univ : req.query.univ_id,
            teaching:false
        })
        res.send({
            sessions
           
        })
    } catch (error) {
        res.send({
            error
          
            
        })
    }
})
Router.get('/cancelled',async (req,res)=>{
    try {
        const sessions = await Sessions.find({
            univ : req.query.univ_id,
            cancelled:true
        })
        res.send({
            sessions
           
        })
    } catch (error) {
        res.send({
            error
          
            
        })
    }
})
Router.get('/completed',async (req,res)=>{
    try {
        const sessions = await Sessions.find({
            univ : req.query.univ_id,
            done:true
        })
        res.send({
            sessions
           
        })
    } catch (error) {
        res.send({
            error
          
            
        })
    }
})
Router.get('/userteaching',async (req,res)=>{ // jisme wo padha rha h
    try {
        const sessions = await Sessions.find({
            student : req.query.student_id
        })
        res.send({
            sessions
           
        })
    } catch (error) {
        res.send({
            error
          
            
        })
    }
})
Router.post('/register',async (req,res)=>{ // register kar rha h
    try {
        const sessions = await Sessions.findById(req.body.session_id)
        sessions.attendees.push(req.body.student_id)
        await sessions.save()
        res.send({
            done:true
        })
    } catch (error) {
        res.status(400).send({
            done:false
        })
    }
})
Router.get('/userteaching1',async (req,res)=>{ // jisme usne register kiya h
    try {
        const sessions = await Sessions.find({
            attendees : req.query.student_id
        })
        res.send({
            sessions
           
        })
    } catch (error) {
        res.send({
            error
          
            
        })
    }
})
Router.post('/rate',async (req,res)=>{
    try {
        var  session = await Sessions.findById(req.body.session_id)
        session.nrated +=1
        session.ratings = (session.ratings + req.body.rating) / session.nrated
        session = await session.save()
        res.send({
            session
        })
    } catch (error) {
        console.log(error)
        res.send({
            error,
           
            
        })
    }
})

Router.post('/rsvp',async (req,res)=>{
    try {
        var  session = await Sessions.findById(req.body.session_id)
        session.rsvp  = true
        session = await session.save()
        res.send({
            session
        })
    } catch (error) {
        console.log(error)
        res.send({
            error,
           
            
        })
    }
})
Router.post('/cancel',async (req,res)=>{
    try {
        var  session = await Sessions.findById(req.body.session_id)
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
        var  session = await Sessions.findById(req.body.session_id)
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
module.exports = Router