const config = {
    // mysql connections
    sql_connection: {
        connectionLimit : '',
        host            : '',
        user            : '',
        password        : '',
        database        : '',
        debug           : false
    },
    sql_pool() {
        return `mysql.createPool(${this.mysql_connection})`;
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
