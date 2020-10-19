const express = require('express');
const app = express();
const path = require('path')
const { config } = require('./config')
const { authUser } = require('./auth')
var MongoClient = require('mongodb').MongoClient;

app.set('views', path.join(__dirname, "./views"));
app.set('view engine', 'ejs');
//public kansio missä on css/js jutut jne.
app.use(express.static(path.join(__dirname, "../public")));

app.get('/', (req, res) => {
    MongoClient.connect(config.db_url(), {useNewUrlParser: true, useUnifiedTopology: true}, (err, client) => {
        if (!err) {
          const collection = client.db(config.db_name).collection(config.db_collection.users);
          collection.find({}).toArray((err, readCollection) => {
            if (!err) { 
                let output = "<h4>Käyttäjät</h4>";
                readCollection.forEach(element => {
                    output += element.email;
                    output += "<hr>" 
                     
                }); 
                var makeThis = readCollection
                res.render('index', { makeThis: makeThis });
                
                // res.send(output)
                } 
            })
             //client.close();
        }
        
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




app.listen(config.portNumber, err => {console.log(err ? `Serveri ei lähtenyt pyörimään` : `Serveri pyörii localhost:${config.portNumber}`)});
 