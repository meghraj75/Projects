const mongoose=require("mongoose");
const Schema=mongoose.Schema;
const passportLocalMongoose=require("passport-local-mongoose");

const userSchema=new Schema({
   email:{
       type:String ,
       required:true
   }
   //username and password automatically define by passport local mongoose
})

//this plugin username  hashing and salting automatically implement krdega 
userSchema.plugin(passportLocalMongoose);

module.exports=mongoose.model('User',userSchema);