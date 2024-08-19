const Joi=require('joi');
const review = require('./models/review');

//to validate listing scheama
//in joy there is object that name is listing
module.exports.listingschema=Joi.object({
listing:Joi.object({
    //parameter of object
    title:Joi.string().required(),
    description:Joi.string().required(),
    location:Joi.string().required(),
    country: Joi.string().required(),
    price:Joi.number().required().min(0),//min value of price that should equal to 0
    image:Joi.string().allow("",null)  //image should be null or empty
}).required()
});


module.exports.reviewsSchema=Joi.object({
    review:Joi.object({
        ratings:Joi.number().required().min(1).max(5),
        comment:Joi.string().required(),
    }).required()
});