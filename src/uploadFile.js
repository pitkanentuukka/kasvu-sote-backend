const uuidv4 = require('uuid').v4

const allowedFiles = [
  "application/pdf",
  "application/msword",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  "application/vnd.openxmlformats-officedocument.wordprocessingml.template",
  "application/vnd.ms-word.document.macroEnabled.12",
  "application/vnd.ms-word.template.macroEnabled.12",
  "application/vnd.ms-excel",
  "application/vnd.ms-excel",
  "application/vnd.ms-excel",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.template",
  "application/vnd.ms-excel.sheet.macroEnabled.12",
  "application/vnd.ms-excel.template.macroEnabled.12",
  "application/vnd.ms-excel.addin.macroEnabled.12",
  "application/vnd.ms-excel.sheet.binary.macroEnabled.12",
  "application/vnd.ms-powerpoint",
  "application/vnd.ms-powerpoint",
  "application/vnd.ms-powerpoint",
  "application/vnd.ms-powerpoint",
  "application/vnd.openxmlformats-officedocument.presentationml.presentation",
  "application/vnd.openxmlformats-officedocument.presentationml.template",
  "application/vnd.openxmlformats-officedocument.presentationml.slideshow",
  "application/vnd.ms-powerpoint.addin.macroEnabled.12",
  "application/vnd.ms-powerpoint.presentation.macroEnabled.12",
  "application/vnd.ms-powerpoint.template.macroEnabled.12",
  "application/vnd.ms-powerpoint.slideshow.macroEnabled.12"
]




module.exports.uploadFile = (req, res, next) => {
  if (req.files) {

    const file = req.files.submission
    if (allowedFiles.includes(file.mimetype)) {
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
    } else {
      res.status(400).json({"msg": "please send a pdf or a MS Office file"}).end

    }

  } else {
    // file not found
    res.status(400).json({"msg": "no file"}).end()
  }

}
