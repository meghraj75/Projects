const express=require('express');
const router=express.Router();
const wrapAsync = require("../utils/wrapAsync.js");
const Listing = require("../models/listing.js");
const {isLoggedIn, isOwner,validateListing}=require("../middleware.js");

const listingController=require("../Controller/listing.js")
const multer  = require('multer')
const {storage}=require("../cloudConfig.js");
const upload = multer({ storage })//initalize multer means form ke ander jo file ayegi unhe kha save krna hai



//post req ayi to post pr jayegi get ayi to get pr jayegi
router
.route("/")
.get(wrapAsync(listingController.index))
.post( isLoggedIn, 
  upload.single("listing[image]"),
  validateListing,
  wrapAsync(listingController.createListing));

//new route
router.get("/new", isLoggedIn,listingController.rendernewForm);







router.route("/:id")
//show route  [means when we click on card this our show route ]
.get(wrapAsync(listingController.showListing))
//update route
.put(isLoggedIn,isOwner,validateListing,
  wrapAsync(listingController.updateListing))
  //delete route
.delete(
  isLoggedIn,
  wrapAsync(listingController.deleteListing)
);




//edits
router.get(
  "/:id/edit",
  isLoggedIn,
  isOwner,
  wrapAsync(listingController.renderEditForm)
);





module.exports=router;