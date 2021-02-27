const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const s = {
    type:String,
    required:true
}
const QuestionSchema = new mongoose.Schema({
    title:s,
    desc:s,
    awarded:{
        type:Boolean,
        default:false
    },
    student : {
        type :id ,
        ref :"Student"
    },
    univ :{
        type:id,
        ref:"University"
    },
    upvote :{
        type:Number,
        default:0
    },
    downvote :{
        type:Number,
        default:0
    },
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