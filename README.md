# KASVU - sote app
Esittely/Demo versio Stadin AOlle.

## Kuinka tätä Appia käytetään?

### Config.js

Tarkista että ``` src/config.js ```tiedostossa on kaikki tarvittavat tiedot

### Käynnistys

Asenna tarvittavat paketit:
``` npm install ```

Käynnistä sovellus komennolla:
```npm run devStart```

### Tällä hetkellä toimivat API-kutsut

- POST /api/user/login/ {email, password}
- GET /api/user/logout/
- GET /api/user/auth

- GET /api/common/modules
hae lista tutkintoon kuuluvista moduuleista
- GET /api/common/categories
hae lista moduuliin kuuluvista kategorioista

## teacher

- GET /api/teacher/students/
palauttaa listan sisäänkirjautuneen opettajan oppilaista
- POST /api/teacher/addProblem
- POST /api/teacher/addTheory
lisää teoria / ongelmanratkaisutehtävän
- GET /api/teacher/getAssignmentsForStudentAndCriteria
hae tietyn oppilaan kriteerikohtaiset tehtävät, sekä teoria että ongelmanratkaisu
- GET /api/teacher/deleteTheory
- GET /api/teacher/deleteProblem
poista teoria- tai ongelmanratkaisutehtävä


## student
