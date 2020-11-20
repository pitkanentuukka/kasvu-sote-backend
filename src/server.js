const express = require('express');
const path = require('path');

const { authUser } = require('./auth');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')
const dotenv = require('dotenv')
dotenv.config()

const app = express();
app.use(cookieParser())
app.use(bodyParser())

app.listen(process.env.SERVER_PORT, err =>
  {console.log(err ? `Serveri ei lähtenyt pyörimään` : `Serveri pyörii localhost:${process.env.SERVER_PORT}`)});
app.use('/api/user', require('./routes/user'))
app.use('/api/tasks', require('./routes/tasks'))
app.use('/api/teacher', require('./routes/teacher'))
app.use('/api/instructor', require('./routes/instructor'))
app.use('/api/student', require('./routes/student'))
app.use('/api/common', require('./routes/common'))
