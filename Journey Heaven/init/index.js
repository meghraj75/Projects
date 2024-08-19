const mongoose=require('mongoose');
const initData=require("./data.js");
const Listing=require("../models/listing.js");

const MONGO_URL="mongodb://127.0.0.1:27017/wanderlust";  //wanderlust is db name


main().then(()=>{
console.log("connected to db");
}).catch(err=>{
    console.log(err);
});


//connect db to mongo
async function main(){
   await mongoose.connect(MONGO_URL);
}


const initDB=async()=>{
    //if alredy data exist then delete the data
    await Listing.deleteMany({});
    //har ek indvidual obj ke liye nyi property ko add krdega mtlb hmari listing ki sari property to ayegi bt uske sath mai hm ek owern define krdenge
    initData.data= initData.data.map((obj)=>({...obj,owner:"66992669a3d675a9af2fcf01"}));

    await Listing.insertMany(initData.data);//it is object and data is key in data.js

    console.log("data was init");
};
initDB();




//store in user collections 
// _id: ObjectId('66992669a3d675a9af2fcf01'),
// email: 'megharajnarkhede0@gmail.com',
// username: 'megharaj',