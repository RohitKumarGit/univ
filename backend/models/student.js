const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const studentSchema = new mongoose.Schema({
    name :{
        type:String,
        required:true
    },
    uid :{
        type:String,
        required:true
    },
    roll :{
        type : String,
        required:true
    },
    email :{
        type :String,
        required:true
    },
    univ :{
        type:id,
        ref:"University"
    },
    credits :{
        type:Number,
        default:100
    }
})
const Student = new mongoose.model("Student",studentSchema)
module.exports = Student
