const pool = require('../../config/database');  //importing the pool we created


module.exports = {
    getUsers: callBack => {
    pool.query(
      `select * from users`,
      [],
      (error, results, fields) => {
        if (error) {
          return callBack(error);
        }
        return callBack(null, results);
      }
    );
    },
    createUsers: (data, callBack) => {
    console.log(data)
    pool.query(
      `insert into users (username,  email, first_name, last_name, phone_number, gender_id, department_id, password ) 
      values(?,?,?,?,?,?,?,?)`,
      [
        data.username,
        data.email,
        data.first_name,
        data.last_name,
        data.phone_number,
        data.gender_id,
        data.department_id,
        data.password
      ],
      (error, results, field) => {
        if (error) {
           return callBack(error);
        }
        return callBack(null, results);
      }
    );
    },
    createVisitors: (data, callBack) => {
        console.log(data)
        pool.query(
          `insert into visitors(fullname, user_id, purpose_id, date_added, address) values(?,?,?,?,?)`,
          [
            data.fullname,
            data.user_id,
            data.purpose_id,
            data.date_added,
            data.address
          ],
          (error, results, field) => {
            if (error) {
               return callBack(error);
            }
            return callBack(null, results);
          }
        );
    },
    getVisitors: callBack => {
      pool.query(
        `select * from visitors`,
        [],
        (error, results, fields) => {
          if (error) {
            return callBack(error);
          }
          return callBack(null, results);
        }
      );
    },
    getVisitorPurpose: callBack => {
      pool.query(
        `select id, purpose from purpose`,
        [],
        (error, results, fields) => {
          if (error) {
            return callBack(error);
          }
          return callBack(null, results);
        }
      );
    },
    getUserByUserId: (id, callBack) => {
      pool.query(
        `select username,  email, first_name, last_name, phone_number, gender_id, department_id from users where id=?`,
        [id],
        (error, results, fields) => {
          if (error) {
            callBack(error);
          }
          return callBack(null, results[0]);
        }
      );
    },
    updateUser: (data, callBack) => {
      pool.query(
        `update  users set username=?,  email=?, first_name=?, last_name=?, phone_number=?, gender_id=?, department_id=? where id = ?`,
        [
          data.username,
          data.email,
          data.first_name,
          data.last_name,
          data.phone_number,
          data.gender_id,
          data.department_id,
          data.id
        ],
        (error, results, fields) =>{
          if (error) {
            callBack(error);
          }
          return callBack(null, results);
        }
      );
    },
    deleteUser: (data, callBack) => {
      pool.query(
        `delete from users where id = ?`,
        [data.id],
        (error, results, fields) => {
          if (error) {
            return callBack(error);
          }   
          return callBack(null, results[0]);
        }
      );
    },
    getVisitorsByVisitorId: (id, callBack) => {
      pool.query(
        `select fullname, user_id, purpose_id, date_added, address from visitors  where id=?`,
        [id],
        (error, results, fields) => {
          if (error) {
            callBack(error);
          }
          return callBack(null, results[0]);
        }
      );
    },
    updateVisitors: (data, callBack) => {
      pool.query(
        `update visitors set fullname=?, user_id=?, purpose_id=?, date_added=?, address=? where id=?`,
        [
          data.fullname,
          data.user_id,
          data.purpose_id,
          data.date_added,
          data.address,
          data.id
        ],
        (error, results, fields) =>{
          if (error) {
            callBack(error);
          }
          return callBack(null, results);
        }
      );
    },
    deleteVisitors: (data, callBack) => {
      pool.query(
        `delete from visitors where id = ?`,
        [data.id],
        (error, results, fields) => {
          if (error) {
            return callBack(error);
          }   
          return callBack(null, results[0]);
        }
      );
    },
    getUserByUserEmail: (email, callBack) => {
      pool.query(
        `select * from users where email = ?`,
        [email],
        (error, results, fields) => {
          if (error) {
            callBack(error);
          }
          return callBack(null, results[0]);
        }
      );
    }
};