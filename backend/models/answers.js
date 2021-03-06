const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const s = {
    type:String,
    required:true
}
const QuestionSchema = new mongoose.Schema({
   
    desc:s,
    awarded:{
        type:Boolean,
        default:false
    },
    question :{
        type:id,
        ref:"Question"
    },
    student : {
        type :id ,
        ref :"Student"
    },
    name :String,
    univ :{
        type:id,
        ref:"University"
    },
    file :{
        type:String,
    
    }
},{
    timestamps:true
})
const Question = mongoose.model("Answers",QuestionSchema)
module.exports = Question