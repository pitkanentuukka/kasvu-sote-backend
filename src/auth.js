const authUser = (req, res, next) => {
    if (req.user == null) {
      res.status(403)
      return res.send ("no access")
    //   return res.redirect('/no-access');
    }
  
    next()
  }

module.exports = { authUser }