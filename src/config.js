const mysql = require('mysql');

const config = {
    // mysql connections
    sql_connection: {
        connectionLimit : 10,
        host            : 'localhost',
        user            : 'root',
        password        : '',
        database        : 'kasvu',
        debug           : false
    },
    sql_pool() {
        return mysql.createPool(this.sql_connection);
    },
    portNumber: "3000"
}

module.exports = { config };
