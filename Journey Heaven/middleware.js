const Listing = require("./models/listing");
const ExpressError = require("./utils/ExpressError.js");
const { listingschema, reviewsSchema } = require("./schema.js");
const Review = require("./models/review.js");


module.exports.isLoggedIn = (req, res, next) => {
  if (!req.isAuthenticated()) {
    ///redirect url //listings/new  if user looged in the save path using orginalUrl
    req.session.redirectUrl = req.originalUrl;
    req.flash("error", "you must be logged in to creating listing");
    return res.redirect("/login");
  }
  next();
  ///functionality
// user come and do some things in website then it will ask login Credential then this process global
// ---->path----->login----->after login redirect to path where first user access page

};

//save redirect url bcz passport reset session automatically when req goes to login passport reset path so that why we have to store in another local varible this variable access every where and passport dos'n delte it

module.exports.saveRedirectUrl = (req, res, next) => {
  if (req.session.redirectUrl) {
    res.locals.redirectUrl = req.session.redirectUrl;
  }
  next();
};

//for authorization to check owner only update the listing that no one can update
//to check jo bhi current user hai wo listing ka owner hai ya nhi
module.exports.isOwner = async (req, res, next) => {
  //call lagaye Listing ko using id to if user is owner of listing or not
  let { id } = req.params;
  let listing = await Listing.findById(id);
  if (!listing.owner._id.equals(res.locals.currUser._id)) {
    req.flash("error", "You don't have permission to update");
    //return nhi kiya to niche wale update opreation bhi run ho jayege
    return res.redirect(`/listings/${id}`);
  }
  next();
};

//validateListing middleware
//function for joi and pass to each path
module.exports. validateListing = (req, res, next) => {
  // Validate the request body against the Joi schema
  const { error } = listingschema.validate(req.body);

  if (error) {
    // Extract error messages and create an instance of ExpressError
    const errmsg = error.details.map((el) => el.message).join(",");
    return next(new ExpressError(401, errmsg)); // Pass error to next middleware
  }
  next(); // Proceed to the next middleware or route handler if no error
};


//validate reviews
module.exports.validateReviews = (req, res, next) => {
  let { err } = reviewsSchema.validate(req.body);
  if (err) {
    let errMsg = err.details.map((el) => el.message).join(",");
    throw new ExpressError(400, errMsg);
  } else {
    next();
  }
};


//jo bhi review ko delete kr rha kya wo uska author hai 
module.exports.isReviewAuthor = async (req, res, next) => {
 
  let { id,reviewId} = req.params;
  let review = await Review.findById(reviewId);
  if (!review.author._id.equals(res.locals.currUser._id)) {
    req.flash("error", "You are not the author of this review");
    return res.redirect(`/listings/${id}`);
  }
  next();
};