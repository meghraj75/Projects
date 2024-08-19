const express=require('express');
const router=express.Router({mergeParams:true});
const ExpressError = require("../utils/ExpressError.js");
const wrapAsync = require("../utils/wrapAsync.js");
const {validateReviews, isLoggedIn,isReviewAuthor}=require("../middleware.js");
const Review = require("../models/review.js");
const Listing = require("../models/listing.js");
const reviewController=require("../Controller/reviews.js")

//Reviews
//Post Route
router.post(
    "/",
    isLoggedIn,
    validateReviews,
    wrapAsync(reviewController.createReview)
  );
  
  //delete reviews route
router.delete(
    "/:reviewId",
    isLoggedIn,
    isReviewAuthor,
    wrapAsync(reviewController.deleteReview)
  );

  module.exports=router;