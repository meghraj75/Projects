
const express=require('express');
const app=express();
const users=require("./routes/user.js");
const posts=require("./routes/posts.js")

const session=require("express-session")

const sessionOptions={
    secret:"mysecretkey",
    resave:false,
    saveUninitialized:true,
};
app.use(session(sessionOptions))

app.get("/register",(req,res)=>{
   let{name="anonymous"}=req.query;
   req.session. name=name;
   console.log(req.session.name)
   res.send(name); 
})

//kisi ka bhi name pass ho jata hai to ye use hello kahega

app.get("/hello",(req,res)=>{
    res.send(`hello ${req.session.name}`)
})
// app.get("/reqcount",(req,res)=>{
//     //if value exist then ++ otherwise in else initialized it [req track using express session middleware ]
//     if(req.session.count){
//         req.session.count++;
// }
// else{
//     req.session.count=1;
// }
//     res.send(`u send a req ${req.session.count} times`)
// })

// app.get("/test",(req,res)=>{
//     console.log("succesffll")
// })
app.listen(8080,()=>{
    console.log("listening")
})

// resave  forces session to be saved back to sessionn store even if the session was never modified during request 
// saveUninitialized : when this option is set to true but the saveUninitialized opetion is set to false then will not
// be set on a response with an unintialized session .only modify the behaviour when an existing session was loaded for reqest[jo session abhi intialized bhi nhi huwa use store kr under save hoga ]