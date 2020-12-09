const {getRoleAndId} = require('./cookie-helper')

module.exports.checkRole = role => {
  if (Array.isArray(role)) {
    return (req, res, next) => {
      if (req.cookies.token) {
        req.authData = getRoleAndId(req.cookies.token)
        if (role.includes(req.authData.role)) {
          next()
        } else {
          res.status(401).end()
        }
      } else {
        res.status(401).end()
      }
    }
  } else {

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
}
//module.exports = {checkRole}
