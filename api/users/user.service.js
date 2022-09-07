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
    pool.query(
      `insert into visitors(fullname, user_id, purpose_id, address, phone_number) values(?,?,?,?,?)`,
      [
        data.fullname,
        data.user_id,
        data.purpose_id,
        data.address,
        data.phone_number
      ],
      (error, results, field) => {
        if (error) {
          return callBack(error);
        }
        signInVisitor(results);
        addVisitorTag(results.insertId);
        updateVisitorStatusFalse();
        return callBack(null, results);
      }


    );
  },
  getVisitors: callBack => {
    pool.query(
      `
        select v.id as id, v.fullname as fullname, v.purpose_id as purpose, v.date_added as date_added, v.address as address, v.phone_number as phone_number,
        c.time_in as time_in, c.time_out as time_out,u.first_name as first_name, u.last_name as last_name, t.tag as tag
        from clock_in c
        join visitors v on v.id = c.visitor_id
        join users u on u.id = v.user_id
        join visitor_tag t on t.visitor_id = c.visitor_id 
        where date(c.time_in) = current_date
        order by id desc
        `,
      [],
      (error, results, fields) => {
        if (error) {
          return callBack(error);
        }
        return callBack(null, results);
      }
    );
  },
  getAllVisitors: callBack => {
    pool.query(
      `
        select v.id as id, v.fullname as fullname, v.purpose_id as purpose, v.date_added as date_added, v.address as address, v.phone_number as phone_number,
        c.time_in as time_in, c.time_out as time_out,u.first_name as first_name, u.last_name as last_name
        from visitors v
        join clock_in c on v.id = c.visitor_id
        join users u on u.id = v.user_id
        `,
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
        `select v.id as id, v.fullname as fullname, v.purpose_id as purpose, v.date_added as date_added, v.address as address, v.phone_number as phone_number,
        c.time_in as time_in, c.time_out as time_out,u.first_name as first_name, u.last_name as last_name, t.tag as tag
        from visitors v
        join visitor_tag t on t.visitor_id = v.id
        join clock_in c on v.id = c.visitor_id
        join users u on u.id = v.user_id
        where v.id like'%${id}%'
        `,
        [id],
        (error, results, fields) => {
          if (error) {
            callBack(error);
          }
          return callBack(null, results);
        }
      );
  },
  getVisitorByFullname: (fullname, callBack) => {
      pool.query(
        `
        select v.id as id, v.fullname as fullname, v.purpose_id as purpose, v.date_added as date_added, v.address as address, v.phone_number as phone_number,
        c.time_in as time_in, c.time_out as time_out,u.first_name as first_name, u.last_name as last_name
        from clock_in c
        join visitors v on v.id = c.visitor_id
        join users u on u.id = v.user_id
        where v.fullname like '%${fullname}%'
        `,
        [fullname],
        (error, results, fields) => {
          if (error) {
            callBack(error);
          }
          return callBack(null, results);
        }
      );
  },
  updateVisitors: (data, callBack) => {
      pool.query(
        `update visitors set fullname=?, user_id=?, purpose_id=?, date_added=?, address=?, phone_number where id=?`,
        [
          data.fullname,
          data.user_id,
          data.purpose_id,
          data.date_added,
          data.address,
          data.phone_number,
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
  updateVisitorClockout: (data, callBack) => {
    updateVisitorStatusTrue(data)
      pool.query(
        `update clock_in set time_out = now() where visitor_id=? and time_out=?`,
        [
          data.id,
          '2000-08-02 00:00:00'
        ],
        (error, results, fields) =>{
          if (error) {
            callBack(error);
          }
          return callBack(null, results);
        }
      );
  },
  clockoutTagNumber: (data,callBack) => {
    if (data.tag === data.tag_no) {
      updateVisitorStatusTrue(data);
      pool.query(
        `update clock_in set time_out = now() where visitor_id=? and time_out=?`,
        [
          data.id,
          '2000-08-02 00:00:00'
        ],
        (error, results, fields) =>{
          if (error) {
            callBack(error);
          }
          return callBack(null, results);
          
        }
      );
    }else{
      const test = (error, results) =>{
        return callBack(null, results);
      }
      test();
    }
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
  },
  signedInVisitors: (fullname, callBack) => {
    pool.query(
      `
        select v.id as id, v.fullname as fullname, v.purpose_id as purpose, v.date_added as date_added, v.address as address, v.phone_number as phone_number,
        c.time_in as time_in, c.time_out as time_out,u.first_name as first_name, u.last_name as last_name
        from clock_in c
        join visitors v on v.id = c.visitor_id
        join users u on u.id = v.user_id
        where date(c.time_out) != current_date and  date(c.time_in) = current_date and v.fullname like '%${fullname}%'
        order by id desc
        `,
      [fullname],
      (error, results, fields) => {
        if (error) {
          return callBack(error);
        }
        return callBack(null, results);
      }
    );
  },

};


signInVisitor = (results) => {
  pool.query(
    `insert into clock_in(visitor_id) values(?)`,
    [
      results.insertId
    ],
    (error, results, fields) => {
      if (error) {
        return error;
      }
      return results;
    }
  )
}

const addVisitorTag = (visitorId) =>{
  pool.query(
    `SELECT tag_number FROM tag WHERE tag_status IS TRUE LIMIT 1`,
    [],
    (error, results, fields) => {
      if (error) {
        return error;
      }
      const tagNumb = JSON.parse(JSON.stringify(results));
      numb = tagNumb[0].tag_number;
      const val = visitorId + " " + numb;
      console.log(val);
      pool.query(
        `insert into visitor_tag(visitor_id,tag) values(?,?)`,
          [visitorId,numb]
      )
    }
   )
}

const updateVisitorStatusFalse = () =>{
  pool.query(
    `SELECT tag_number FROM tag WHERE tag_status IS TRUE LIMIT 1`,
    [],
    (error, results, fields) => {
      if (error) {
        return error;
      }
      const tagNumb = JSON.parse(JSON.stringify(results));
      numb = tagNumb[0].tag_number;
      pool.query(
        `update tag set tag_status = false where tag_number = ${numb}`,
          []
      )
    }
   )
}
const updateVisitorStatusTrue = (data) =>{
  const tag = data.tag
  pool.query(
    `update tag set tag_status = true where tag_number = ${tag}`,
    [],
    (error, results, fields) => {
      if (error) {
        return error;
        }
    } 
  )
}

