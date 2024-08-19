
const express=require('express');
const app=express();
const users=require("./routes/user.js");
const posts=require("./routes/posts.js")

const session=require("express-session")
const flash=require('connect-flash');

//set cookie expiry
const sessionOptions={
    secret:"mysecret",
    resave:false,
    saveUninitalized:true,
    cookie:{
      expires:Date.now()+7*24*60*60*1000 , //7 days and 7 days ki andr kitne hours 7*24 hours 24 hours ke andr kitne minute hoge 24*60 minutes har minute ke andr kitne second honge 60 second har 60 sec ke anddr 1000ms honge
      maxAge:7*24*60*60*1000,
      httpOnly:true,//for security cross scripting attack not possible due to this
    },
  };
app.use(session(sessionOptions))

app.get("/register",(req,res)=>{
   let{name="anonymous"}=req.query;
   req.session. name=name;
   
   res.redirect("/hello")
})

//kisi ka bhi name pass ho jata hai to ye use hello kahega

app.get("/hello",(req,res)=>{
    res.send(`hello ${req.session.name}`)
})

//we access this cookie in hello route 



app.listen(8080,()=>{
    console.log("listening")
})
