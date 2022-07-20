const express= require("express")
const { default: mongoose } = require("mongoose")
const userRouter=require('./routes/user')
const bodyParser=require('body-parser')
const { urlencoded } = require("body-parser")


const app= express()
app.use(bodyParser.json());
app.use(
    express.urlencoded({ extended: true })
);
    

port = process.env.port || 5000,
app.listen(port,()=> console.log("Backend is running "+port))
const uri = "mongodb+srv://mini_project:project123@mini-project.pd8fgae.mongodb.net/?retryWrites=true&w=majority"
mongoose.connect(uri,{useNewUrlParser:true})
const con= mongoose.connection
con.on('open',()=>{
    console.log("Database connected...");
})


app.use('/user',userRouter)
