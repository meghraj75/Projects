const Listing=require("../models/listing")
const Review = require("../models/review.js");
module.exports.createReview=async (req, res) => {
    let listing = await Listing.findById(req.params.id);
    let newReview = new Review(req.body.review);
    //to storea author of reviw
    newReview.author=req.user._id;

    listing.reviews.push(newReview);
    await newReview.save();
    await listing.save();
    req.flash("success","Review created")
    res.redirect(`/listings/${listing._id}`);
  }

  module.exports.deleteReview=async (req, res) => {
    let { id, reviewId } = req.params;
    //update listing after delteing reviews  [deleting from review id when id matched]
    await Listing.findByIdAndUpdate(id, { $pull: { reviews: { _id: reviewId } } });
    await Review.findByIdAndDelete(reviewId);
    req.flash("success","Revivew Deleted successfully")
    res.redirect(`/listings/${id}`);
    
  }