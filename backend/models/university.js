const mongoose = require('mongoose')
const id = mongoose.Types.ObjectId
const universitySchema = new mongoose.Schema({
    name :{
        type:String,
        required:true
    }
    ,
    students :[{
        type:id,
        ref:"Student"
    }],
    uid :{
        type:String,
        required:true
    },
    address :{
        type:String,
        required:true
    },
    phone :{
        type :Number,
        required:true,
        min:10,
        max :10
    },
    email :{
        type:String,
        required:true
    },
    logo :{
        type:String,
        required:true
    
    }
})
const University = mongoose.model("University",universitySchema)
mongoose.model = University
