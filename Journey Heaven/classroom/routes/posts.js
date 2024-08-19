const express=require('express');
const app=express();
const router=express.Router();

router.get("/postssd",(req,res)=>{
    res.send("posts routes")
})
module.exports=router;