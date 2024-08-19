if(process.env.NODE_ENV !="production")
{
  require('dotenv').config();
}



const express = require("express");
const app = express();
const mongoose = require("mongoose");
const path = require("path");
const methodOverride = require("method-override");
const ejsmate = require("ejs-mate"); //help to create teplate means layout create krne mai
const ExpressError = require("./utils/ExpressError.js");
const listingsRouter= require("./routes/listing.js");
const reviewsRouter=require("./routes/review.js");
const userRouter=require("./routes/user.js");
const session=require("express-session")
const MONGO_URL = "mongodb://127.0.0.1:27017/wanderlust"; //wanderlust is db name
const flash=require("connect-flash")
const passport=require("passport");
const LocalStatergy=require("passport-local");
const User=require("./models/user.js")
 
main()
  .then(() => {
    console.log("connected to db");
  })
  .catch((err) => {
    console.log(err);
  });

//connect db to mongo
async function main() {
  await mongoose.connect(MONGO_URL);
}

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));
app.use(express.urlencoded({ extended: true }));
app.use(methodOverride("_method"));
app.engine("ejs", ejsmate); 
app.use(express.static(path.join(__dirname, "public")));




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


// app.get("/", (req, res) => {
//   res.send("hi i am root");
// });



app.use(session(sessionOptions))
app.use(flash());

app.use(passport.initialize());
app.use(passport.session());

passport.use(new LocalStatergy(User.authenticate())); 

// use static serialize and deserialize of model for passport session support
passport.serializeUser(User.serializeUser());  
passport.deserializeUser(User.deserializeUser());


app.use((req,res,next)=>{
  res.locals.success=req.flash("success")
  res.locals.error=req.flash("error")
  res.locals.currUser=req.user;
  next();
})

app.get("/demouser",async(req,res)=>{
  let fakeuser=new User({
    email:"fakeemail",
    username:"password"
  });

 let newuser=await User.register(fakeuser,"helloworld");
 res.send(newuser);

})


app.use("/listings",listingsRouter)

app.use("/listings/:id/reviews",reviewsRouter);

app.use("/",userRouter);

//if any route not match this route excutes
app.all("*", (req, res, next) => {
  next(new ExpressError(404, "page not found"));
});

app.use((err, req, res, next) => {
  let { statusCode = 500, message = "something went wrong" } = err;
  res.status(statusCode).render("Error.ejs", { err });
});
app.listen(8080, () => {
  console.log(" server is listening to port 8080");
});
