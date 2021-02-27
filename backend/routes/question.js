// post - done
// upvote - done
// downvote -done
// post answer - done
// get all questions of univ - done
//  get all unanswerd questions  - done
// get all answered questions 
const Router = require('express').Router()
const Question = require('../models/questions')
const Answers = require('../models/answers')
const Student = require('../models/student')
Router.post('/question',async (req,res)=>{
    try {
        console.log(req.body)
        const q = await Question.create(req.body)
        res.send({question:q})
    } catch (error) {
        console.log(error)
        res.status(400).send()
    }
})
Router.post('/upvote',async (req,res)=>{
    try {
        const q = await Question.findById(req.body.question_id)
        q.upvote.push(req.body.student)

        await q.save()
        res.send({question:q})
    } catch (error) {
        res.status(400).send()
    }
})
Router.post('/downvote',async (req,res)=>{
    try {
        const q = await Question.findById(req.body.question_id)
       q.downvote.push(req.body.student)
        await q.save()
        res.send({question:q})
    } catch (error) {
        res.status(400).send()
    }
})
Router.post('/answer',async (req,res)=>{
    try {
        const q = await Question.findById(req.body.question_id)
        const a = await Answers.create(req.body.answer)
        q.answered = true,
        q.answers.push(a._id)
       
       
        await q.save()
        await a.save()
        res.send({
            done:true
        })
    } catch (error) {
        res.status(400).send()
    }
})
Router.get('/hack',async (req,res)=>{
    const  q = await Question.find()
    res.send(q)
})
Router.get('/',async (req,res)=>{
    try {
        const questions = await Question.find({
            univ:req.query.univ_id
        }).populate("answers student")
        res.send({questions})
    } catch (error) {
        res.status(400).send()
    }
})
Router.get('/unanswered',async (req,res)=>{
    try {
        const questions = await Question.find({
            univ:req.query.univ_id,
            answered:false
        })
        res.send({questions})
    } catch (error) {
        res.status(400).send()
    }
})
Router.get('/answered',async (req,res)=>{
    try {
        const questions = await Question.find({
            univ:req.query.univ_id,
            answered:true
        })
        res.send({questions})
    } catch (error) {
        res.status(400).send()
    }
})
Router.post('/award',async (req,res)=>{
    try {
        const a = await Answers.findById(req.body.aid)
        a.awarded = true
        const s = await Student.findById(a.student)
        s.credits += 5
        const s1 = await Student.findById(req.body.aid1) // a1d - jisne q pucha h
        sq.credits -=5
        await s.save()
        await s1.save()
        await a.save({
            done :true
        })
        res.send()
    } catch (error) {
        res.status(400).send()
    }
})
module.exports = Router