const express = require('express');
const app = express();
const path = require('path')
const { config } = require('./config')
const { authUser } = require('./auth')
const MongoClient = require('mongodb').MongoClient;



//public kansio missä on frontend jutut jne.
app.use(express.static(path.join(__dirname, "../public")));

app.get('/', (req, res) => {
    MongoClient.connect(config.db_url(), {useNewUrlParser: true, useUnifiedTopology: true}, (err, client) => {
        if (!err) {
          const collection = client.db(config.db_name).collection(config.db_collection.users);
          collection.find({}).toArray((err, readCollection) => {
            if (!err) { 
                let output = "<h4>Käyttäjät</h4>";
                readCollection.forEach(element => {
                    console.log(element.id); 
                    output += element.email;
                    output += "<hr>"
                    
                });
                res.send(output)
                } 
            })
             //client.close();
        }
        
    }) 
    
});

//kun on kirjautunut sisälle niin tämä on näkymä missä on kaikki tiedot jne jne..
app.get('/etu', authUser, (req, res) => {
    res.send('Tehtävä sivusto, ainoastaan rekisteröitynyt oppilas näkee tämän')
});

//oppilaan tehtavat luoteltu
app.get('/tehtavat', authUser, (req, res) => {
    res.send('Tehtävä sivusto, ainoastaan rekisteröitynyt oppilas näkee tämän')
});




app.listen(config.portNumber, ()=> {console.log(`Serveri pyörii localhost:${config.portNumber}`)});
 