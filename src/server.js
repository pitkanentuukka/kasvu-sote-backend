const express = require('express');
const app = express();
const path = require('path');
const { config } = require('./config');
const { authUser } = require('./auth');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')
const bodyParser = require('body-parser')

const dotenv = require('dotenv')
dotenv.config()

app.set('views', path.join(__dirname, "./views"));
app.set('view engine', 'ejs');
//public kansio missä on css/js jutut jne.
app.use(express.static(path.join(__dirname, "../public")));
var jsonParser = bodyParser.json()

app.get('/', (req, res) => {
    config.sql_pool().getConnection(function(err, connection) {
        connection.query('SELECT Testi FROM testi', function (error, results, fields) {
            if (error) throw error;
            connection.release();
            console.log('Toimii ', results[0].Testi);
            res.render('index');

        });
    })
});

//kun on kirjautunut sisälle niin tämä on näkymä missä on kaikki tiedot jne jne..
app.get('/etu', authUser, (req, res) => {
    res.send('Tehtävä sivusto, ainoastaan rekisteröitynyt oppilas näkee tämän')
    res.redirect('/no-access');
});

//oppilaan tehtavat luoteltu
app.get('/tehtavat', authUser, (req, res) => {
    res.send('Tehtävä sivusto, ainoastaan rekisteröitynyt oppilas näkee tämän')
});

//ei pääsyoikeutta
app.get('/no-access', (req, res) => {
    res.send('Ei pääsy oikeutta, ota yhteys jne.')

});
app.post('/login', jsonParser, (req, res) => {

  const email = req.body.email
  const password = req.body.password
  if (email && password) {

    let sql = "select * from user where email = ?"
    let inserts = email;

    config.sql_pool().getConnection((err, connection) => {


      connection.query(sql, inserts, (error, results, fields) =>{

        if (results.length === 0) {
          res.status(403).json({"message": "invalid username or password"})
        } else {
          bcrypt.compare(password, results[0].password, (bcerr, bcres)=> {
            if (bcres) {
              const userId = results[0].user_id;
              const role = results[0].role;
              const payload = { email, role, userId }
              const token = jwt.sign(payload, process.env.JWT_KEY, {
                expiresIn: '365d'}
              )
              res.status(200).cookie('token', token, {httpOnly : true})
              res.end()
            } else {
                res.status(403).json({"msg": "invalid username or password"})
            }
          })
          }
        })
      })
    } else {
      res.status(400).json({"msg": "missing email or password"})
    }


})



app.listen(config.portNumber, err => {console.log(err ? `Serveri ei lähtenyt pyörimään` : `Serveri pyörii localhost:${config.portNumber}`)});
