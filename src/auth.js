const {getRoleAndId} = require('./cookie-helper')

/*
const authUser = (req, res, next) => {
    if (req.user == null) {
      res.status(403)
      return res.send ("no access")
    //   return res.redirect('/no-access');
    }

    next()
  }

module.exports = { authUser }

*/
module.exports.checkRole = role => {

  return (req, res, next) => {

    if (req.cookies.token) {
      req.authData = getRoleAndId(req.cookies.token)
      if (req.authData.role === role) {
        next()
      } else {
        res.status(401).end()
      }
    } else {
      res.status(401).end()
    }
  }
}
//module.exports = {checkRole}
