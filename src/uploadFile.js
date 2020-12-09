const uuidv4 = require('uuid').v4


module.exports.uploadFile = (req, res, next) => {
  if (req.files) {

    const file = req.files.submission
    if (file.mimetype !== "application/pdf") {
      res.status(400).json({"msg": "please send a pdf file"}).end
    } else {

      // make sure all file names are completely unique
      const newName = uuidv4() + file.name
      const completePath = process.env.FILE_UPLOAD_PATH + newName;

      try {
        file.mv(completePath)
        req.filePath = completePath
        next()
      } catch (e) {
        res.status(500).json(e).end()
      }
    }

  } else {
    // file not found
    res.status(400).json({"msg": "no file"}).end()
  }

}
