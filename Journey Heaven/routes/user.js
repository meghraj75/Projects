
const express=require('express');
const router=express.Router();
const User=require("../models/user.js");
const wrapAsync = require('../utils/wrapAsync.js');
const passport = require('passport');
const { saveRedirectUrl } = require('../middleware.js');
const userController=require("../Controller/users.js")


router.route("/signup")
.get(userController.rederSignupForm)
//post method se sign up change in db
.post( wrapAsync(userController.signup));



//user ke authenticate krne ka kam passport krta hai passport us kam ko middleware se krta hai

router.route("/login") 
.get(userController.rederLoginForm)
.post( saveRedirectUrl,passport.authenticate("local",
    {failureRedirect:"/login",failureFlash:true}),
userController.login);



router.get("/logout",userController.logout)

module.exports=router;