
const express=require('express');
const app=express();
const users=require("./routes/user.js");
const posts=require("./routes/posts.js")

const session=require("express-session")
var flash = require('connect-flash');
const path=require("path")
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));


const sessionOptions={
    secret:"mysecretkey",
    resave:false,
    saveUninitialized:true,
};
app.use(session(sessionOptions))
app.use(flash());

app.get("/register", (req, res) => {
    const { name = "anonymous" } = req.query;
    req.session.name = name;

    if(name==="anonymous"){
    req.flash("success", "User not registered ");
    }else{
        req.flash("success","user register succssfully")
    }
    res.redirect("/hello");
});



app.get("/hello",(req,res)=>{
res.locals.successMsg=req.flash("success");  //successsMsg is varibale name
res.locals.errorMsg=req.flash("error");
    res.render("flash", { name: req.session.name });
});
//res.locals= use this property to set varibles accessible in 
// templated render with res.render varible set on res.locals are available within a single request response cycle and will not be shared between req
//we access this cookie in hello route 



app.listen(8080,()=>{
    console.log("listening")
})
