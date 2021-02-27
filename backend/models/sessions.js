const { Session } = require('inspector')
const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const SessionsSchema = new mongoose.Schema({
    title :{
        type:String,
        required:true
    },
    ratings :{
        type:Number,
        default:0
    },
    credit :{
        type:Number,
        required:true,
        min:1,
        max:20
    },
    tags :[String],
    link :{
        type:String,
        required:true
    },
    date :{
        type:Date,
        required:true
    },
    time :{
        start :{
            type:Date
        },
        end :{
            type:Date
        }
    },
    maxattendees :{
        type:Number,
        max:15,
        min:1
    },
    student :{
        type:id ,
        ref:"Student"
    },
    univ :{
        type :id ,
        ref:"University"
    },
    attendees :[{
        type:id ,
        ref:"Student"
    }],
    done :{
        type:Boolean,
        default:false
    },
    cancelled :{
        type:Boolean,
        default:false
    }
})
const Sessions = mongoose.model("Sessions",SessionsSchema)
module.exports = Sessions