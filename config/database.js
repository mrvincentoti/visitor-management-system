const { createPool } = require('mysql');

const pool = createPool({
    port:process.env.DB_PORT,
    host:process.env.DB_HOST,
    user:process.env.DB_USER,
    password:process.env.DB_PASS,
    database:process.env.MYSQL_DB,
    authKey: process.env.AUTH_KEY,
    connectionLimit: 10
});

module.exports = pool; //exports the pool which allows it to be used in other parts of the program