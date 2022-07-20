const express=require('express')
const router=express.Router()
const User=require('../models/user')

router.post('/',async(req,res)=>{
    const user=new User({
        role:req.body.role,
        name:req.body.name,
        username:req.body.username,
        email:req.body.email,
        phone:req.body.phone,
        password:req.body.password
    })
    try{
        const a1= await user.save()
        res.json(a1)
    }
    catch(err){
        res.send(err)
    }

})

router.post('/login',async(req,res)=>{
    const {email,password}=req.body
    if(!email || !password){
        return res.status(400).json({
            message:"email or password not present"
        })
    }
        try{
            const user= await User.findOne({email,password})
            if(!user){
                res.status(401).json({
                    message:"Login not succesful",
                    error:"User not found"
                })
            }
            else{
                res.status(200).json({
                    message:"Login successful",
                    user
                })
            }
        }
        catch(err){
            res.status(400).json({
                message:"An error ocuured",
                error:err.message
            })
        }
    
})

module.exports=router