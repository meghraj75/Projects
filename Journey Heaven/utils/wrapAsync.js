module.exports = (fn)=>{
    return (req,res,next)=>{
        fn(req,res,next).catch(next);  
    };
}
// module.exports = (fn) => {
//     return function(req, res, next) {
//       fn(req, res, next).catch((err) => { // `err` is defined within the `catch` block
//         next(err); // Passes `err` to Express error handling middleware
//       });
//     };
//   };
  