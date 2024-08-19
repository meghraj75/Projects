

const express=require('express');
const app=express();
const users=require("./routes/user.js");
const posts=require("./routes/posts.js")
const cookieParser=require("cookie-parser")
const session=require("express-session")


// app.use(cookieParser("secretcode"));

// app.get("/getsigncookie",(req,res)=>{
//     res.cookie("made in","india",{signed:true});
//     res.send("signed cookie send");
// })

// //to check signed cookie is not break by other then update cookie in chrome application and send it req repeat it will print {} and if u just change value then it will print but display false

// app.get("/verify",(req,res)=>{
//     console.log(req.signedCookies);
//     res.send("verify");
// })

// app.get("/getcookie",(req,res)=>{
//     res.cookie("greet","hii") //key and value
//     res.send("send some cookie");
// })
// app.get("/",(req,res)=>{
//     //parsse cookie
//     console.dir(req.cookies);
//    res.send("i am root");
// })

// app.get("/greet",(req,res)=>{
//   let{name="anonymous"}=req.cookies;
//   res.send(`hi${name}`);  
// })
// app.use("/users",users);
// app.use("/posts",posts);

app.use(session({secret:"mysuperscret"}))
app.get("/test",(req,res)=>{
    console.log("succesffll")
})
app.listen(8080,()=>{
    console.log("listening")
})