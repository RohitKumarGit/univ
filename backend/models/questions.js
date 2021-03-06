const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const s = {
    type:String,
    required:true
}
const QuestionSchema = new mongoose.Schema({

    title:s,
    desc:s,
    credit :{
        type:Number,
        required:true,
        min:1,
        max:20,
        default:5
    },
    tags:[String],
    student : {
        type :id ,
        ref :"Student"
    },
    univ :{
        type:id,
        ref:"University"
    },
    answered :{
        type:Boolean,
        default:false
    },
    answers:[{
        type:id ,
        ref:"Answers"
    }],
    upvote :[{
        type:id,
        ref:"Student"
    }],
    downvote :[{
        type:id,
        ref:"Student"
    }],
    priority :{
        type :Boolean,
        default:false
    },
    file :{
        type:String,
    
    }
},{
    timestamps:true
})
const Question = mongoose.model("Question",QuestionSchema)
module.exports = Question