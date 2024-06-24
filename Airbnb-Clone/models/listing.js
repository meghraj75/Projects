const mongoose=require("mongoose");


const listingSchema=new mongoose.Schema({
    title:{
       type: String,
        required:true,
    },
    description:String,
    image:{  
             // for the image our type is string but we set a defualt value using new virtual mongo syntx 
     type:String,
      default:"https://unsplash.com/photos/a-lone-tree-in-the-middle-of-a-foggy-field-sMsxUARkCos",//for testing
      set:(v)=>v=== ""? "https://unsplash.com/photos/a-lone-tree-in-the-middle-of-a-foggy-field-sMsxUARkCos":v, // v is a image value [frontend image value] is v equal to empty string if yes then set defaultimage if not then original image
},                        // default link

    price:Number,
    location:String,
    country:String
});

const Listing=mongoose.model("Listing",listingSchema);
module.exports=Listing;