const express=require("express");
const app=express();
const mongoose=require("mongoose");
const Listing=require("./models/listing.js");
const path=require('path');
const methodOverride=require('method-override');
const ejsmate=require("ejs-mate");//help to create teplate means layout create krne mai


const MONGO_URL="mongodb://127.0.0.1:27017/wanderlust";  //wanderlust is db name


main().then(()=>{
console.log("connected to db");
}).catch(err=>{
    console.log(err);
});


//connect db to mongo
async function main(){
   await mongoose.connect(MONGO_URL);
}

app.set("view engine","ejs");
app.set("views",path.join(__dirname,"/views"));
app.use(express.urlencoded({extended:true}));
app.use(methodOverride("_method"));
app.engine('ejs',ejsmate);//
app.use(express.static(path.join(__dirname, 'public')));


app.get("/",(req,res)=>{
    res.send("hi i am root");
});


//index route
app.get("/listings",async(req,res)=>{
  const allListings=await Listing.find({});
  res.render("listings/index.ejs",{allListings}); //here we render all data from db to frontend using ejs 
});

//
app.get("/listings/new",(req,res)=>{
    res.render("listings/new.ejs");
})


//show route
app.get("/listings/:id",async(req,res)=>{
 let {id}=req.params;
const listing= await Listing.findById(id);
res.render("listings/show.ejs",{listing});
});
 

//create route -- async fun bcz here we do changes on db [the data coming from form we add in db]
app.post("/listings",async(req,res)=>{
// let {title,description,image,price,country,location}=req.body; old way 
const newListing=new Listing(req.body.listing);   // all data coming in js objects so we parse then we have instance aa jayegi
await newListing.save();
res.redirect("/listings");
});


//edits
app.get("/listings/:id/edit",async(req,res)=>{
 let {id}=req.params;
const listing= await Listing.findById(id);
res.render("listings/edit.ejs",{listing});

});

//update route
app.put("/listings/:id",async(req,res)=>{
    let {id}=req.params;         //deconstruct body.listing it is js object that contain all parameter [desconstruct krke un parameter ko individul value ke andr convert krenge jis ko hum nyi update value ke andr pass krdege]
   await Listing.findByIdAndUpdate(id,{...req.body.listing});
   res.redirect(`/listings/${id}`);
                 //it directlly gone to show.ejs
});

//delete route
app.delete("/listings/:id",async(req,res)=>{
    let {id}=req.params;
   let deleteListing= await Listing.findByIdAndDelete(id);
   console.log(deleteListing);
   res.redirect("/listings");
})
app.listen(8080,()=>{
    console.log(" server is listening to port 8080");
});