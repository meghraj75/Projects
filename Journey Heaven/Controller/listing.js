const Listing=require("../models/listing")


//index is fun 
module.exports.index=async (req, res) => {
    const allListings = await Listing.find({});
    return res.render("listings/index.ejs", { allListings }); //here we render all data from db to frontend using ejs
  }

module.exports.rendernewForm=(req, res) => {

    res.render("listings/new.ejs");
  }

  module.exports.showListing=async (req, res) => {
    let { id } = req.params;
    const listing = await Listing.findById(id)

    //nested populated har ek review ke liye uska author
    .populate({path: "reviews",populate:{
      path:"author",
    },
  })
    .populate("owner");
    if(!listing){
      req.flash("error","Listing You requested does not exist");
      res.redirect("/listings")
    }
 
    res.render("listings/show.ejs", { listing });
  }


  module.exports.createListing=async (req, res, next) => {
    //from image path we get our url and filename
    let url=req.file.path;
    let filename=req.file.filename;
     
    const newListing = new Listing(req.body.listing);// all data coming in js objects so we parse then we have instance aa jayegi
     //hamre new listing ka owner ho usme current user id store hi store ho 
     newListing.owner=req.user._id;
     newListing.image={url,filename};//add url and filename 
    if (!newListing.description) {
      throw new ExpressError(401, "Description missing");
    }
  
    await newListing.save();
    req.flash("success", "New listing created");
    res.redirect("/listings");
  }



module.exports.renderEditForm=async (req, res) => {
    let { id } = req.params;
    const listing = await Listing.findById(id);
    if(!listing){
      req.flash("error","Listing You requested does not exist");
      res.redirect("/listings")
    }


    //to change our image quality in edit form 
    let originalImageUrl=listing.image.url;
    originalImageUrl=originalImageUrl.replace("/upload","/upload/w_250")
    res.render("listings/edit.ejs", { listing,originalImageUrl });
  }

  module.exports.updateListing=(async (req, res) => {
    let { id } = req.params; //deconstruct body.listing it is js object that contain all parameter [desconstruct krke un parameter ko individul value ke andr convert krenge jis ko hum nyi update value ke andr pass krdege]
    await Listing.findByIdAndUpdate(id, { ...req.body.listing });
    req.flash("success","Listing updated")
    res.redirect(`/listings/${id}`);
    //it directlly gone to show.ejs
  })

  module.exports.deleteListing=async (req, res) => {
    let { id } = req.params;
   
    let deleteListing = await Listing.findByIdAndDelete(id);
     console.log(deleteListing);
     req.flash("success","Deleted successfully")
    res.redirect("/listings");
  }