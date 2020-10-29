const jwt = require('jsonwebtoken')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')

dotenv.config()

module.exports.getRoleAndId = function (cookie) {

  let returnData = {};
   jwt.verify(cookie, process.env.JWT_KEY, (err, authData) => {
    if(err) {
      return
    } else {

      returnData = authData;
    }
  })
  return returnData;
};
