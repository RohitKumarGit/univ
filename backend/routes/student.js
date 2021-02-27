const Router = require('express').Router()
const Student = require('../models/student')
const University = require('../models/university')
// done
Router.post('/',async (req,res)=>{
    try {
        const student = await Student.create(req.body.student)
        const univ = await University.findById(req.body.student.univ)
        univ.students.push(student._id)
        await univ.save()
        res.send({
            created:true,
            student,
            univ
        })
    } catch (error) {
        console.log(error)
        res.status(400).send({error})
    }
})
Router.get('/hack',async (req,res)=>{
    const  q = await Student.find()
    res.send(q)
})
Router.get('/',async (req,res)=>{
    try {
        const student = await Student.findOne({uid:req.query.uid}).populate("univ")
        res.send({
            
            student
        })
    } catch (error) {
        console.log(error)
        res.status(400).send({error})
    }
})
Router.get('/verify',async (req,res)=>{
    try {
        const student = await Student.find({uid:req.query.uid}).populate("univ")
        if(student.length){
            res.send({
                isNew : false,
                student
            })
        }
        
        res.send({
            isNew:true
        })
    } catch (error) {
        console.log(error)
        res.status(400).send({error})
    }
})
Router.get('/all',async (req,res)=>{
    try {
        const students = await Student.find({
            univ:req.query.univ_id
        })
        res.send(students)
    } catch (error) {
        console.log(error)
    }
})
module.exports = Router