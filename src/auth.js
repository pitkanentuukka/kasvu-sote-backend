const authUser = (req, res, next) => {
    if (req.user == null) {
      res.status(403)
      return res.send('Tarvitsee kirjautua sisään')
    }
  
    next()
  }

module.exports = { authUser }