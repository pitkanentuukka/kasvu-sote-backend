const mysql = require('mysql');

const config = {
    // mysql connections
    sql_connection: {
        connectionLimit : 10,
        host            : 'localhost',
        user            : 'sote_kasvu',
        password        : 'password',
        database        : 'sote_kasvu',
        debug           : false
    },
    sql_pool() {
        return mysql.createPool(this.sql_connection);
    },
    // db_name: "kasvu",
    // db_user: "kasvu-dbuser",
    // db_password: "",
    // db_collection: {
    //     users: "userBase",
    //     roles: "userRoles"
    // },
    // db_url() {
    //     return `mongodb+srv://${this.db_user}:${this.db_password}@cluster0.srkdp.mongodb.net/${this.db_name}?retryWrites=true&w=majority`
    // },
    portNumber: "3000"
}

module.exports = { config };
