const mysql = require('mysql2/promise');

const config = {
    // mysql connections
    sql_connection: {
        connectionLimit : 10,
        host            : process.env.DB_HOST,
        user            : process.env.DB_USER,
        password        : process.env.DB_PASSWORD,
        database        : process.env.DB_SCHEMA,
        debug           : false
    },
    sql_pool() {

        return mysql.createPool(this.sql_connection);
    },
    portNumber: "4000"
}
console.log(process.env.DB_HOST);
console.log(config.sql_connection);
module.exports = { config };
