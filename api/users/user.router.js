const {          //We have to import all the controllers in the router
    createVisitors,
    getUserByUserId,
    getVisitors,
    updateUser,
    deleteUser,
    getVisitorsByVisitorId,
    updateVisitors,
    deleteVisitors,
    login,
    getUsers,
    createUsers
} = require('./user.controller');

const router = require('express').Router();
const { checkToken } = require('../../auth/token_validation');


//Now we have to define the route for all the controllers
router.post('/visitor/createVisitors', checkToken, createVisitors);    //we are passing the request to 'creatUser' in the user.controller
router.get('/visitor/getVisitors', checkToken, getVisitors);
router.get('/visitor/getVisitorsByVisitorId:id', checkToken, getVisitorsByVisitorId);
router.patch('/visitor/updateVisitors', checkToken, updateVisitors);
router.delete('/visitor/deleteVisitors', checkToken, deleteVisitors);
router.get('/user/getUserByUserId:id', checkToken, getUserByUserId);
router.patch('/user/updateUsers', checkToken, updateUser);
router.delete('/user/deleteUser', checkToken, deleteUser);
router.post('/user/login', login);   //used for login
router.get('/user/getUsers', getUsers);
router.post('/user/createUsers', createUsers);

module.exports = router;