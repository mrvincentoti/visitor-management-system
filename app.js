require('dotenv').config();
const express = require('express');    //creating express application
const cors = require("cors");
const app = express();
const corsOptions = {
    origin: "http://localhost:3001"
};
const userRouter = require('./api/users/user.router'); //importing user.router             //initializing express application


app.use(express.json());   //converting .JSON object into JS object
app.use(cors(corsOptions));

// app.get('/api', (req, res)=>{          //This callback method will take request and response object
//     res.json({
//         success:1,
//         message: 'This os rest api working'
//     });
// });


app.use('/api', userRouter); //if any request comes we pass it to the userRouter route

app.listen(process.env.APP_PORT, () => {
    console.log('Server up and running on port: ', process.env.APP_PORT);
});