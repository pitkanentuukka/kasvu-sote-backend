const config = {

    db_name: "kasvu",
    db_user: "kasvu-dbuser",
    db_password: "xuQjoT6ZoUWPKO7B",
    db_collection: {
        users: "userBase",
        roles: "userRoles"
    },
    db_url() {
        return `mongodb+srv://${this.db_user}:${this.db_password}@cluster0.srkdp.mongodb.net/${this.db_name}?retryWrites=true&w=majority`
    },
    //verkkosivun asetukset
    portNumber: "3000"
}

module.exports = { config };
