//The controller is where we handle all the services

const {
  createVisitors, 
  getUserByUserId, 
  getVisitors,
  getVisitorsByVisitorId, 
  updateUser, 
  deleteUser,
  updateVisitors,
  deleteVisitors,
  getUserByUserEmail,
  getUsers,
  createUsers,
  getVisitorPurpose
} = require('./user.service');  //we called the service

const { genSaltSync, hashSync, compareSync} = require('bcrypt');//importing bcrypt
const {sign} = require('jsonwebtoken');



module.exports = {
  getUsers: (req, res) => {
      getUsers((err, results) => {
          if (err) {
              console.log(err);
              return;
          }
          return res.json({
              success: 1,
              data: results
          });
      });
  },
  createUsers: (req, res) => {
      const body = req.body;
      const salt = genSaltSync(10);
      console.log(body.password);
      body.password = hashSync(body.password, salt);
      createUsers(body, (err, results) => {
          if (err) {
              console.log(err);
              return res.status(500).json({
                  success: 0,
                 message: 'Database connection error'
              });
          }
          return res.status(200).json({
              success: 1,
              data: results
          });
      });
  },
  createVisitors: (req, res) => {
      const body = req.body;
      // const salt = genSaltSync(10);
      // console.log(body.password);
      // body.password = hashSync(body.password, salt);
      createVisitors(body, (err, results) => {
          if (err) {
              console.log(err);
              return res.status(500).json({
                  success: 0,
                 message: 'Database connection error'
              });
          }
          return res.status(200).json({
              success: 1,
              data: results
          });
      });
  },
  updateVisitors: (req, res) => {
    const body = req.body;
    console.log(body);
    // const salt = genSaltSync(10);
    // body.password = hashSync(body.password, salt);
    updateVisitors(body, (err, results) => {
        if (err) {
            console.log(err);
            return;
        }
        if(!results){
            return res.json({
                success: 0,
                message: 'failed to update visitor'
            });
        }
        return res.json({
            success: 1,
            message: 'updated successfully'
        });
    });
  },
  deleteVisitors: (req, res) => {
    const data = req.body;
    deleteVisitors(data, (err, results) =>{
        if (err){
            console.log(err);
            return;
        }
        if (!results) {
            return res.json({
                success: 0,
                message: 'Record not found'
            });
        }
        return res.json({
            success: 1,
            message: 'Visitor deleted successfully'
        });
    });
  },
  getUserByUserId: (req, res) => {
    const id = req.params.id;
    getUserByUserId(id, (err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      if (!results) {
        return res.json({
          success: 0,
          message: "Record not Found"
        });
      }
      return res.json({
        success: 1,
        data: results
      });
    });
  },
  getVisitors: (req, res) => {
      getVisitors((err, results) => {
          if (err) {
              console.log(err);
              return;
          }
          return res.json({
              success: 1,
              data: results
          });
      });
  },
  getVisitorPurpose: (req, res) => {
      getVisitorPurpose((err, results) => {
          if (err) {
              console.log(err);
              return;
          }
          return res.json({
              success: 1,
              data: results
          });
      });
  },
  getVisitorsByVisitorId: (req, res) => {
    const id = req.params.id;
    getVisitorsByVisitorId(id, (err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      if (!results) {
        return res.json({
          success: 0,
          message: "Record not Found"
        });
      }
      return res.json({
        success: 1,
        data: results
      });
    });
  },
  updateUser: (req, res) => {
      const body = req.body;
      console.log(body);
      const salt = genSaltSync(10);
      body.password = hashSync(body.password, salt);
      updateUser(body, (err, results) => {
          if (err) {
              console.log(err);
              return;
          }
          if(!results){
              return res.json({
                  success: 0,
                  message: 'failed to update user'
              });
          }
          return res.json({
              success: 1,
              message: 'updated successfully'
          });
      });
  },
  deleteUser: (req, res) => {
      const data = req.body;
      deleteUser(data, (err, results) =>{
          if (err){
              console.log(err);
              return;
          }
          if (!results) {
              return res.json({
                  success: 0,
                  message: 'Record not found'
              });
          }
          return res.json({
              success: 1,
              message: 'user deleted successfully'
          });
      });
  },
  login: (req, res) => {
      const body = req.body;   //whatever the user passes will be stored in this variable
      getUserByUserEmail(body.email, (err, results) => {
          if (err) {
              console.log(err);
          }
          console.log(results);
          if (!results) {
              return res.json({
                  success: 0,
                  data: 'Invalid email or password'
              });
          }
        //   return res.json({
        //     success: 1,
        //     message: "login successful",
        //   });
          const result = compareSync(body.password, results.password);
          console.log(body.password);
          console.log(results.password);
          console.log(result);
          if (result) {
              results.password = undefined;
              const jsontoken = sign({ result: results }, process.env.AUTH_KEY, {
                  expiresIn: '1h' 
              }); //sign takes 3 parameters
              return res.json({
                  success: 1,
                  message: 'login successful',
                  user: results,
                  token: jsontoken
                  
              });
          }else{
              return res.json({
              success: 0,
              message: 'Invalid email or password',
          });
          }  //Now we are calling this service
      });
  }
};

//We have definded all the controllers, now it's time to define the route