const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const NotesSchema = new mongoose.Schema({
    user : {
        type:id ,
        ref:"Student"
    },
    title :{
        type:String,
        required:true
    },
    credits :{
        type:Number,
        min:1,
        max:10
    },
    thumbnail:{
        type:String,
        required:true
    },
    tags :[String],
    univ :{
        type:id ,
        ref:"Univeristy"
    },
    saved_by :[{
        type:id,
        ref:"Student"
    }]
},{timestamps:true})
const Notes = mongoose.model("Notes",NotesSchema)
module.exports = Notes
