const mongoose=require("mongoose");
const Schema=mongoose.Schema;
const Review=require("./review.js")


const listingSchema=new mongoose.Schema({
    title:{
       type: String,
        required:true,
    },
    description:String,
    image:{  
          url :String,
          filename:String,          
}, 
     price:Number,
    location:String,
    country:String,
    reviews:[
        {
            //sare review particular hotel ke un sb ke object id to is array me store krenge 
           type:Schema.Types.ObjectId,
           ref:"Review"
        },
    ],
    //it refers to user 
    owner:{
        type:Schema.Types.ObjectId,
        ref:"User",   
    }
});

//delete review when listing delete 
listingSchema.post("findOneAndDelete",async(listing)=>{
    if(listing){
    await Review.deleteMany({ $_id: {$in:listing.reviews}});
    }
})

const Listing=mongoose.model("Listing",listingSchema);
module.exports=Listing;